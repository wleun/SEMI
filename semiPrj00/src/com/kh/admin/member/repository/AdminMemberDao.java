package com.kh.admin.member.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.event.vo.AdminEventVo;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;

public class AdminMemberDao {

	public int getCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM MEMBER";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	

	public List<MemberVo> selectList(Connection conn, PageVo pageVo) {
		
		List<MemberVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql= "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT NO , TYPE , M_LEVEL , NICK , EMAIL , PHONE , STATUS , ENROLL_DATE , SUSPEND_DATE , QUIT_DATE FROM MEMBER ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<MemberVo>();
			
			while(rs.next()) {
				
				MemberVo vo = new MemberVo();
				
				String no = rs.getString("NO");
				String type = rs.getString("TYPE");
				String mLevel = rs.getString("M_LEVEL");
				String nick = rs.getString("NICK");
				String email = rs.getString("EMAIL");
				String phone = rs.getString("PHONE");
				String status = rs.getString("STATUS");
				Timestamp enrollDate = rs.getTimestamp("ENROLL_DATE");
				Timestamp suspendDate = rs.getTimestamp("SUSPEND_DATE");
				Timestamp quitDate = rs.getTimestamp("QUIT_DATE");
				
				
				vo.setNo(no);
				vo.setType(type);
				vo.setmLevel(mLevel);
				vo.setNick(nick);
				vo.setEmail(email);
				vo.setPhone(phone);
				vo.setStatus(status);
				vo.setEnrollDate(enrollDate);
				vo.setSuspendDate(suspendDate);
				vo.setQuitDate(quitDate);
				
				list.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
