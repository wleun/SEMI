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

	public List<ProjectVo> selectProject(Connection conn, String category, String sort, PageVo pageVo) {
		
		String sql = "SELECT T.* FROM ( SELECT ROWNUM RNUM, P.* FROM PROJECT P WHERE CATEGORY_NO = ? AND STATUS = ? ) T WHERE RNUM BETWEEN ? AND ?";
		
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
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return projectList;
	}

	public List<ProjectVo> selectProjectAll(Connection conn, PageVo pageVo) {
		String sql = "SELECT T.* FROM ( SELECT ROWNUM RNUM, P.* FROM PROJECT P WHERE STATUS = 'I' OR STATUS = 'S' OR STATUS = 'B' ) T WHERE RNUM BETWEEN ? AND ?";
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit()+1;
			int end = start+pageVo.getBoardLimit()-1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return projectList;
	}

	public CategoryVo selectCategory(Connection conn, String category) {
		// TODO Auto-generated method stub
		return null;
	}

	public int listCount(Connection conn) {
		// TODO Auto-generated method stub
		return 0;
	}

}
