package com.kh.project.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.category.vo.CategoryVo;
import com.kh.common.vo.PageVo;

import static com.kh.common.JDBCTemplate.*;

import com.kh.project.repository.PrjCategoryDao;
import com.kh.project.vo.ProjectVo;

public class PrjCategoryService {
	
	private PrjCategoryDao dao = new PrjCategoryDao();
	
	/*
	 * 총 프로젝트 수 조회
	 */
	public int listCount() {
		
		Connection conn = null;
		int result =0;
		
		try {
			conn = getConnection();
			
			result = new PrjCategoryDao().listCount(conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
	}
	

	/*
	 * 프로젝트 불러오기(현재 페이지)
	 */
	public List<ProjectVo> selectProject(String category, String sort, PageVo pageVo) {
		
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		Connection conn = null;
		
		try {
			
			conn = getConnection();
			
			//sort 를 sql에 맞춤
			if("ongoing".equals(sort)) {sort="I";}
			if("complete".equals(sort)) {sort="S";}
			if("intended".equals(sort)) {sort="B";}
			
			//sort & category 다른거 들어올 시의 방어코드
			if(sort=="I" || sort=="S" || sort=="B") {
				switch(category) {
					case "1":
					case "2":
					case "3":
					case "4":
					case "5":
					case "6":
					case "7":
					case "8":
					case "9":
					case "10":
					case "11":
					case "12":
						projectList = dao.selectProject(conn, category, sort, pageVo);
						break;
					case "21"://인기
					case "22"://신규
					case "23"://마감임박
					default:
						projectList = dao.selectProjectAll(conn, pageVo);
				}
			}else {
				projectList = dao.selectProjectAll(conn, pageVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return projectList;
	}//selectProject

	
	/*
	 * 카테고리 불러오기
	 */
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
