package com.kh.admin.project.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.kh.admin.project.vo.AdminPrjVo;
import com.kh.common.vo.PageVo;

public class AdminPrjDao {

	//프로젝트 관련 카운트
	public int getCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(PROJECT_NO) AS COUNT FROM PROJECT";
		
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

	//프로젝트 페이징 리스트
	public List<AdminPrjVo> selectList(Connection conn, Connection conn2, PageVo pageVo) {
		
		List<AdminPrjVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT P.PROJECT_NO , P.STATUS , C.NAME AS CATEGORY_NAME , P.NAME AS PROJECT_NAME , M.NICK AS MAKER_NAME , TO_CHAR(P.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(P.END_DATE,'YYYY-MM-DD') AS END_DATE FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN CATEGORY C USING(CATEGORY_NO) ORDER BY P.PROJECT_NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminPrjVo>();
			
			while(rs.next()) {
				
				
				AdminPrjVo vo = new AdminPrjVo();
				
				String no = rs.getString("PROJECT_NO");
				String status = rs.getString("STATUS");
				String categoryName = rs.getString("CATEGORY_NAME");
				String projectName = rs.getString("PROJECT_NAME");
//				String achievementQuotient = rs.getString("ACHIEVEMENT_QUOTIENT");
				String makerName = rs.getString("MAKER_NAME");
				String startDate = rs.getString("START_DATE");
				String endDate = rs.getString("END_DATE");
				String reportCnt = getPrjReportCnt(conn2,no);
				
				
				
				if("B".equals(status)) {
					status = "진행전";
				} else if("I".equals(status)) {
					status = "진행중";
				} else if("S".equals(status)) {
					status = "성공";
				} else if("F".equals(status)) {
					status = "실패";
				} else {
					status = "삭제됨";
				}
				
				
				
				
				vo.setNo(no);
				vo.setStatus(status);
				vo.setCategoryName(categoryName);
				vo.setProjectName(projectName);
//				vo.setAchievementQuotient(achievementQuotient);
				vo.setMakerName(makerName);
				vo.setStartDate(startDate);
				vo.setEndDate(endDate);
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

	//프로젝트 신고 횟수
	private String getPrjReportCnt(Connection conn2, String no) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = "";
		
		String sql ="SELECT COUNT(R.NO) AS COUNT FROM REPORT R JOIN PROJECT P ON (R.PROJECT_NO = P.PROJECT_NO) WHERE P.PROJECT_NO=?";
		
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

	//프로젝트 삭제 (ajax, select)
	public int deleteProject(Connection conn, String projectNo) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE PROJECT SET STATUS = 'D' WHERE PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, projectNo);
			
			result = pstmt.executeUpdate();
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
			return result;
		}


	// 프로젝트 삭제 후 상태 가져오기 (ajax, select)
	public AdminPrjVo selectStatusList(String projectNo, Connection conn) {
		AdminPrjVo projectVo = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT STATUS FROM PROJECT WHERE PROJECT_NO= ?";
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, projectNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				projectVo = new AdminPrjVo();
				
				String status = rs.getString("STATUS");
				
				if("B".equals(status)) {
					status = "진행전";
				} else if("I".equals(status)) {
					status = "진행중";
				} else if("S".equals(status)) {
					status = "성공";
				} else if("F".equals(status)) {
					status = "실패";
				} else {
					status = "삭제됨";
				}
				
				projectVo.setStatus(status);
				projectVo.setNo(projectNo);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return projectVo;
		
	}

	//대시보드 - 시작전인 프로젝트 카운트
	public String getBeforePrjCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = "";
		
		String sql = "SELECT COUNT(PROJECT_NO) AS COUNT FROM PROJECT WHERE STATUS = 'B'";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getString("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	
	}

	//대시보드 - 진행중인 프로젝트 카운트
	public String getPrjCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = "";
		
		String sql = "SELECT COUNT(PROJECT_NO) AS COUNT FROM PROJECT WHERE STATUS = 'I'";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getString("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	
	}

	//대시보드 - 시작전 프로젝트 정보 가져오기
	public List<AdminPrjVo> getBeforePrjData(Connection conn) {
		List<AdminPrjVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT P.PROJECT_NO , P.STATUS , C.NAME AS CATEGORY_NAME , P.NAME AS PROJECT_NAME , M.NICK AS MAKER_NAME , TO_CHAR(P.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(P.END_DATE,'YYYY-MM-DD') AS END_DATE FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN CATEGORY C USING(CATEGORY_NO) WHERE P.STATUS='B' ORDER BY P.PROJECT_NO DESC ) T ) WHERE RNUM BETWEEN 1 AND 4";
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminPrjVo>();
			
			while(rs.next()) {
				
				
				AdminPrjVo vo = new AdminPrjVo();
				
				String no = rs.getString("PROJECT_NO");
				String status = rs.getString("STATUS");
				String projectName = rs.getString("PROJECT_NAME");
				String makerName = rs.getString("MAKER_NAME");
				
				
				
				if("B".equals(status)) {
					status = "진행전";
				} else if("I".equals(status)) {
					status = "진행중";
				} else if("S".equals(status)) {
					status = "성공";
				} else if("F".equals(status)) {
					status = "실패";
				} else {
					status = "삭제됨";
				}
				
				
				int nameLength = projectName.length();
				int subStringLength = 13;
				if(nameLength<subStringLength) {
					subStringLength = nameLength;
				}
				String subName = projectName.substring(0,subStringLength);
				
				
				vo.setNo(no);
				vo.setStatus(status);
				vo.setProjectName(subName);
				vo.setMakerName(makerName);
				
				
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

	//대시보드 - 진행중 프로젝트 정보 가져오기
	public List<AdminPrjVo> getPrjData(Connection conn) {
		List<AdminPrjVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT P.PROJECT_NO , P.STATUS , C.NAME AS CATEGORY_NAME , P.NAME AS PROJECT_NAME , M.NICK AS MAKER_NAME , TO_CHAR(P.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(P.END_DATE,'YYYY-MM-DD') AS END_DATE FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN CATEGORY C USING(CATEGORY_NO) WHERE P.STATUS='I' ORDER BY P.PROJECT_NO DESC ) T ) WHERE RNUM BETWEEN 1 AND 4";
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminPrjVo>();
			
			while(rs.next()) {
				
				
				AdminPrjVo vo = new AdminPrjVo();
				
				String no = rs.getString("PROJECT_NO");
				String status = rs.getString("STATUS");
				String projectName = rs.getString("PROJECT_NAME");
				String makerName = rs.getString("MAKER_NAME");
				
				
				
				if("B".equals(status)) {
					status = "진행전";
				} else if("I".equals(status)) {
					status = "진행중";
				} else if("S".equals(status)) {
					status = "성공";
				} else if("F".equals(status)) {
					status = "실패";
				} else {
					status = "삭제됨";
				}
				
				
				int nameLength = projectName.length();
				int subStringLength = 13;
				if(nameLength<subStringLength) {
					subStringLength = nameLength;
				}
				String subName = projectName.substring(0,subStringLength);
				
				
				vo.setNo(no);
				vo.setStatus(status);
				vo.setProjectName(subName);
				vo.setMakerName(makerName);
				
				
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

	//대시보드 - 성공한 프로젝트 정보 가져오기
	public List<AdminPrjVo> getsuccessPrjData(Connection conn) {
		List<AdminPrjVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT P.PROJECT_NO , P.STATUS , C.NAME AS CATEGORY_NAME , P.NAME AS PROJECT_NAME , M.NICK AS MAKER_NAME , TO_CHAR(P.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(P.END_DATE,'YYYY-MM-DD') AS END_DATE FROM PROJECT P JOIN MEMBER M ON P.MAKER_NO = M.NO JOIN CATEGORY C USING(CATEGORY_NO) WHERE P.STATUS='S' ORDER BY P.PROJECT_NO DESC ) T ) WHERE RNUM BETWEEN 1 AND 4";
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminPrjVo>();
			
			while(rs.next()) {
				
				
				AdminPrjVo vo = new AdminPrjVo();
				
				String no = rs.getString("PROJECT_NO");
				String status = rs.getString("STATUS");
				String projectName = rs.getString("PROJECT_NAME");
				String makerName = rs.getString("MAKER_NAME");
				
				
				
				if("B".equals(status)) {
					status = "진행전";
				} else if("I".equals(status)) {
					status = "진행중";
				} else if("S".equals(status)) {
					status = "성공";
				} else if("F".equals(status)) {
					status = "실패";
				} else {
					status = "삭제됨";
				}
				
				int nameLength = projectName.length();
				int subStringLength = 13;
				if(nameLength<subStringLength) {
					subStringLength = nameLength;
				}
				String subName = projectName.substring(0,subStringLength);
				
				vo.setNo(no);
				vo.setStatus(status);
				vo.setProjectName(subName);
				vo.setMakerName(makerName);
				
				
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
