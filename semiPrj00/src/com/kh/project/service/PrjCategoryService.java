package com.kh.project.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.category.vo.CategoryVo;
import static com.kh.common.JDBCTemplate.*;

import com.kh.project.repository.PrjCategoryDao;
import com.kh.project.vo.ProjectVo;

public class PrjCategoryService {
	
	private PrjCategoryDao dao = new PrjCategoryDao();

	public ArrayList<ProjectVo> selectProject(String category, String sort) {
		
		ArrayList<ProjectVo> projectList = new ArrayList<ProjectVo>();
		Connection conn = null;
		
		try {
			
			conn = getConnection();
			
			if("ongoing".equals(sort)) {sort="I";}
			if("complete".equals(sort)) {sort="S";}
			if("intended".equals(sort)) {sort="B";}
			
			int categoryNum = Integer.parseInt(category);
			if(categoryNum<1 || categoryNum>12) {
				category = null;
			}
			
			if(sort==null && category==null) {
				projectList = dao.selectProjectAll(conn);
			}else if(sort==null) {
				projectList = dao.selectProject(conn, category);
			}else if(category==null) {
				projectList = dao.selectProject(conn, sort);
			}else {
				projectList = dao.selectProject(conn, category, sort);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		
		return projectList;
	}//selectProject
	
	
	
	
	
	
	
	
	
	
	
	

	public CategoryVo selectCategory(String category) {
		
		CategoryVo categoryVo = new CategoryVo();
		Connection conn = null;
		
		try {
			
			conn = getConnection();
			if(category == null) {
				categoryVo.setCategoryNo("0");
				categoryVo.setCategoryName("전체");
			}else {
				categoryVo = new PrjCategoryDao().selectCategory(conn, category);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return categoryVo;
	}//selectCategory


}//class
