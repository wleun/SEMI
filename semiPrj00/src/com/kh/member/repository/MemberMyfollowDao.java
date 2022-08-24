package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.MemberMyfollowVo;

public class MemberMyfollowDao {

	public List<MemberMyfollowVo> selectFollow(Connection conn, String no) {
		
		String sql = "SELECT M.NICK, F.NO, F.MEM_NO, F.MAKER_NO FROM FOLLOW F INNER JOIN MEMBER M ON M.NO = F.MAKER_NO WHERE F.NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MemberMyfollowVo> list = new ArrayList<MemberMyfollowVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no1 = rs.getString("NO");
				String memNo = rs.getString("MEM_NO");
				String makerNo = rs.getString("MAKER_NO");
				String nick = rs.getString("NICK");
				
				MemberMyfollowVo vo = new MemberMyfollowVo();
				vo.setNo(no1);
				vo.setMemNo(memNo);
				vo.setMakerNo(makerNo);
				vo.setNick(nick);
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}

}
