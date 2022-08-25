package com.kh.project.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.common.vo.PageVo;
import com.kh.project.vo.ProjectVo;

public class PrjSearchDao {

	/*
	 * 검색어, 정렬방식으로 프로젝트 수 조회
	 */
	public int listCount(Connection conn, String searching, String sort) {
		String sql = "SELECT COUNT(PROJECT_NO) COUNT FROM PROJECT WHERE NAME LIKE ? AND STATUS = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//SQL 을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searching);
			pstmt.setString(2, sort);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		//실행 결과 리턴
		return count;
	}

	/*
	 * 검색어로 프로젝트 수 조회
	 */
	public int listCount(Connection conn, String searching) {
		String sql = "SELECT COUNT(PROJECT_NO) COUNT FROM PROJECT WHERE NAME LIKE ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//SQL 을 객체에 담기 및 SQL 완성
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searching);
			
			//SQL 실행 및 결과 저장
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		//실행 결과 리턴
		return count;
	}

	/*
	 * 검색어, 정렬방식으로 프로젝트 조회
	 */
	public List<ProjectVo> selectProject(Connection conn, String searching, String sort, PageVo pageVo) {
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT T.* FROM (SELECT ROWNUM RNUM, P.*, C.NAME CATEGORY_NAME, M.NICK NICK FROM PROJECT P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.NAME LIKE ? AND P.STATUS = ? ) T WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			pstmt.setString(1, searching);
			pstmt.setString(2, sort);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProjectVo vo = new ProjectVo();
				
				vo.setPrjectNo(rs.getString("PROJECT_NO"));
				vo.setCategoryNo(rs.getString("CATEGORY_NAME"));
				vo.setName(rs.getString("NAME"));
				vo.setMakerNo(rs.getString("NICK"));
				vo.setStartDate(rs.getString("START_DATE"));
				vo.setEndDate(rs.getString("END_DATE"));
				vo.setGoal(rs.getInt("GOAL"));
				vo.setText(rs.getString("TEXT"));
				vo.setThumbnailName(rs.getString("THUMBNAIL_NAME"));
				vo.setThumbnailPath(rs.getString("THUMBNAIL_PATH"));
				vo.setStatus(rs.getString("STATUS"));
				
				projectList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return projectList;
	}

	/*
	 * 검색어로 프로젝트 조회
	 */
	public List<ProjectVo> selectProject(Connection conn, String searching, PageVo pageVo) {
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT T.* FROM (SELECT ROWNUM RNUM, P.*, C.NAME CATEGORY_NAME, M.NICK NICK FROM PROJECT P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.NAME LIKE ?) T WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			pstmt.setString(1, searching);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProjectVo vo = new ProjectVo();
				
				vo.setPrjectNo(rs.getString("PROJECT_NO"));
				vo.setCategoryNo(rs.getString("CATEGORY_NAME"));
				vo.setName(rs.getString("NAME"));
				vo.setMakerNo(rs.getString("NICK"));
				vo.setStartDate(rs.getString("START_DATE"));
				vo.setEndDate(rs.getString("END_DATE"));
				vo.setGoal(rs.getInt("GOAL"));
				vo.setText(rs.getString("TEXT"));
				vo.setThumbnailName(rs.getString("THUMBNAIL_NAME"));
				vo.setThumbnailPath(rs.getString("THUMBNAIL_PATH"));
				vo.setStatus(rs.getString("STATUS"));
				
				projectList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return projectList;
	}

	/*
	 * 정렬방식으로 프로젝트 조회
	 */
	public List<ProjectVo> selectProjectSort(Connection conn, String sort, PageVo pageVo) {

		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT T.* FROM (SELECT ROWNUM RNUM, P.*, C.NAME CATEGORY_NAME, M.NICK NICK FROM PROJECT P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.STATUS = ? ) T WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			pstmt.setString(1, sort);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProjectVo vo = new ProjectVo();
				
				vo.setPrjectNo(rs.getString("PROJECT_NO"));
				vo.setCategoryNo(rs.getString("CATEGORY_NAME"));
				vo.setName(rs.getString("NAME"));
				vo.setMakerNo(rs.getString("NICK"));
				vo.setStartDate(rs.getString("START_DATE"));
				vo.setEndDate(rs.getString("END_DATE"));
				vo.setGoal(rs.getInt("GOAL"));
				vo.setText(rs.getString("TEXT"));
				vo.setThumbnailName(rs.getString("THUMBNAIL_NAME"));
				vo.setThumbnailPath(rs.getString("THUMBNAIL_PATH"));
				vo.setStatus(rs.getString("STATUS"));
				
				projectList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return projectList;
	}

}
