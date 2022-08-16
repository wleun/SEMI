package com.kh.project.service;

import java.sql.Connection;

import com.kh.category.vo.CategoryVo;
import static com.kh.common.JDBCTemplate.*;
import com.kh.project.repository.PrjCategoryDao;

public class PrjCategoryService {
	
	private PrjCategoryDao dao = new PrjCategoryDao();

	/*
	 * 카테고리별로 select
	 */
	public CategoryVo selectCategory(String category, String sort) {
		
		CategoryVo vo = new CategoryVo();
		Connection conn = null;
		
		conn = getConnection();
		
		try {
			if(sort != null) {
				if("ongoing".equals(sort)) {sort="I";}
				if("complete".equals(sort)) {sort="S";}
				if("intended".equals(sort)) {sort="B";}
			}
			
			if(category != null) {
				int categoryNum = Integer.parseInt(category);
				if(categoryNum<1 || categoryNum>12) {
					vo.setCategoryNo("0");
					vo.setCategoryName("전체");
					vo = dao.selectCategory(conn, sort);
				}else {
					vo = dao.selectCategory(conn, category, sort);
				}
			}else {
				vo.setCategoryNo("0");
				vo.setCategoryName("전체");
				vo = dao.selectCategory(conn, sort);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return vo;
		
	}//selectCategory

}//class
