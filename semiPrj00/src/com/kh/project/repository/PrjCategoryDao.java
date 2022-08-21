package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.category.vo.CategoryVo;
import com.kh.common.vo.PageVo;

import static com.kh.common.JDBCTemplate.*;
import com.kh.project.vo.ProjectVo;

public class PrjCategoryDao {

	/*
	 * 카테고리, 정렬 방식으로 프로젝트 셀렉트 해오기
	 */
	public List<ProjectVo> selectProject(Connection conn, String category, String sort, PageVo pageVo) {
		
		String sql = "SELECT T.* FROM ( SELECT ROWNUM RNUM, P.*, C.NAME CATEGORY_NAME, M.NICK NICK FROM ( SELECT * FROM PROJECT ORDER BY END_DATE DESC )P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.CATEGORY_NO = ? AND P.STATUS = ?) T WHERE RNUM BETWEEN ? AND ?";
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			int categoryNum = Integer.parseInt(category);
			
			pstmt.setInt(1, categoryNum);
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
	 * 모든 프로젝트 셀렉트
	 */
	public List<ProjectVo> selectProjectAll(Connection conn, PageVo pageVo) {
		String sql = "SELECT T.* FROM ( SELECT ROWNUM RNUM, P.*, C.NAME CATEGORY_NAME, M.NICK NICK FROM ( SELECT * FROM PROJECT ORDER BY END_DATE DESC )P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.STATUS = 'I' OR P.STATUS = 'S' OR P.STATUS = 'B') T WHERE RNUM BETWEEN ? AND ?";
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
	 * 카테고리 별로 프로젝트 셀렉트
	 */
	public List<ProjectVo> selectProject(Connection conn, String category, PageVo pageVo) {
		
		String sql = "SELECT T.* FROM ( SELECT ROWNUM RNUM, P.*, C.NAME CATEGORY_NAME, M.NICK NICK FROM ( SELECT * FROM PROJECT ORDER BY END_DATE DESC )P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.CATEGORY_NO = ? AND (P.STATUS = 'I' OR P.STATUS = 'S' OR P.STATUS = 'B')) T WHERE RNUM BETWEEN ? AND ?";
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			pstmt.setString(1, category);
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
	 * 카테고리 번호 통해 카테고리 셀렉트
	 */
	public CategoryVo selectCategory(Connection conn, String category) {
		
		String sql = "SELECT * FROM CATEGORY WHERE CATEGORY_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CategoryVo vo = new CategoryVo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setCategoryNo(category);
				vo.setCategoryName(rs.getString("NAME"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}

		return vo;
	}

	/*
	 * 모든 프로젝트 수 카운트
	 */
	public int listCountAll(Connection conn) {
		
		String sql = "SELECT COUNT(PROJECT_NO) COUNT FROM PROJECT WHERE STATUS = 'I' OR STATUS = 'S' OR STATUS = 'B'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//SQL 을 객체에 담기 및 ㅓSQL 완성
			pstmt = conn.prepareStatement(sql);
			
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
	 * 카테고리, 정렬방식으로 프로젝트 수 조회
	 */
	public int listCount(Connection conn, String category, String sort) {
		
		String sql = "SELECT COUNT(PROJECT_NO) COUNT FROM PROJECT WHERE CATEGORY_NO = ? AND STATUS = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//SQL 을 객체에 담기 및 ㅓSQL 완성
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
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
	 * 카테고리 별로 프로젝트 수 조회
	 */
	public int listCount(Connection conn, String category) {
		
		String sql = "SELECT COUNT(PROJECT_NO) COUNT FROM PROJECT WHERE CATEGORY_NO = ? AND (STATUS = 'I' OR STATUS = 'S' OR STATUS = 'B')";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			//SQL 을 객체에 담기 및 ㅓSQL 완성
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			
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


}
