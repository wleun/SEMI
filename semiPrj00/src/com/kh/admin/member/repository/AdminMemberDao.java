package com.kh.admin.member.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.member.vo.AdminMemberVo;
import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;

public class AdminMemberDao {

	//페이징 관련 카운트
	public int getCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM MEMBER WHERE STATUS = 'A' OR STATUS= 'S'";
		
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
	
	//페이징 관련 리스트
	public List<AdminMemberVo> selectList(Connection conn,Connection conn2, PageVo pageVo) {
		
		List<AdminMemberVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql= "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT NO , TYPE , M_LEVEL , NICK , EMAIL , PHONE , STATUS , ENROLL_DATE , SUSPEND_DATE , QUIT_DATE FROM MEMBER WHERE STATUS = 'A' OR STATUS= 'S' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
	
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminMemberVo>();
			
			while(rs.next()) {
				
				
				AdminMemberVo vo = new AdminMemberVo();
				
				String no = rs.getString("NO");
				String type = rs.getString("TYPE");
				String mLevel = rs.getString("M_LEVEL");
				String nick = rs.getString("NICK");
				String email = rs.getString("EMAIL");
				String phone = rs.getString("PHONE");
				String status = rs.getString("STATUS");
				String enrollDate = rs.getString("ENROLL_DATE");
				String suspendDate = rs.getString("SUSPEND_DATE");
				String quitDate = rs.getString("QUIT_DATE");
				String reportCnt = getMemberReportCnt(conn2,no);
				
				
				
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
				vo.setReportCnt(reportCnt);
				
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
	
	//회원 신고횟수
	public String getMemberReportCnt(Connection conn2, String no) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = "";
		
		
		String sql = "SELECT COUNT(R.NO) AS COUNT FROM REPORT R JOIN MEMBER M ON (M.NO = R.MEMBER_NO) WHERE M.NO= ?";
		
		try {
			
			pstmt= conn2.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getString("COUNT");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return count;
		
	}


	//회원 정지
	public int suspendMember(Connection conn, String memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE MEMBER SET STATUS = 'S' , SUSPEND_DATE = SYSDATE WHERE NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			result = pstmt.executeUpdate();
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
			return result;
		
	}


	//회원 정지 해제
	public int suspendCancelMember(Connection conn, String memberNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE MEMBER SET STATUS = 'A' , SUSPEND_DATE = NULL WHERE NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			result = pstmt.executeUpdate();
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
			return result;
		}

}
