package com.kh.project.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.category.vo.CategoryVo;
import com.kh.common.vo.PageVo;

import static com.kh.common.JDBCTemplate.*;

import com.kh.project.repository.PrjCategoryDao;
import com.kh.project.repository.PrjSearchDao;
import com.kh.project.vo.ProjectVo;

public class PrjCategoryService {
	
	private final PrjCategoryDao dao = new PrjCategoryDao();
	
	/*
	 * 총 프로젝트 수 조회
	 */
	public int listCount(String category, String sort) {
		
		Connection conn = null;
		int result =0;
		
		try {
			conn = getConnection();
			
			//sort 를 sql에 맞춤
			if("ongoing".equals(sort)) {sort="I";}
			if("complete".equals(sort)) {sort="S";}
			if("intended".equals(sort)) {sort="B";}
			if(category == null) {category = "0";}
			
			if("I".equals(sort) || "S".equals(sort) || "B".equals(sort)) {
				if(!("21".equals(category)) && !("22".equals(category)) && !("23".equals(category)) && !("0".equals(category) && "B".equals(sort))) {
					result = dao.listCount(conn, category, sort);
				}else if("0".equals(category) && "B".equals(sort)) {
					result = dao.countSort(conn, sort);
				}
				else {
					switch(category) {
					case "21":
						result = dao.countPopular(conn);
						break;
					case "22":
						result = dao.countEarly(conn);
						break;
					case "23":
						result = dao.countDeadline(conn);
						break;
					}
				}
			}else if("all".equals(sort)) {
				result = dao.listCount(conn, category);
			}else {
				result = dao.listCountAll(conn);
			}
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
			if(category == null) {category = "0";}
			
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
						projectList = dao.selectPopular(conn, pageVo);
						break;
					case "22"://신규
						projectList = dao.selectEarly(conn, pageVo);
						break;
					case "23"://마감임박
						projectList = dao.selectDeadline(conn, pageVo);
						break;
					default:
						projectList = new PrjSearchDao().selectProjectSort(conn, sort, pageVo);
				}
			}else if("all".equals(sort)) {
				projectList = dao.selectProject(conn, category, pageVo);
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
			
			if(category == null) {category = "0";}
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
				categoryVo = new PrjCategoryDao().selectCategory(conn, category);
				break;
			case "21"://인기
				categoryVo.setCategoryNo("21");
				categoryVo.setCategoryName("인기");
				break;
			case "22"://신규
				categoryVo.setCategoryNo("22");
				categoryVo.setCategoryName("신규");
				break;
			case "23"://마감임박
				categoryVo.setCategoryNo("23");
				categoryVo.setCategoryName("마감임박");
				break;
			default:
				categoryVo.setCategoryNo("0");
				categoryVo.setCategoryName("전체");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return categoryVo;
	}//selectCategory

	



}//class
