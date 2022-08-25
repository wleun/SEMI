package com.kh.project.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.common.vo.PageVo;
import com.kh.project.repository.PrjCategoryDao;
import com.kh.project.repository.PrjSearchDao;
import com.kh.project.vo.ProjectVo;

public class PrjSearchService {
	
	private final PrjSearchDao dao = new PrjSearchDao();

	/*
	 * 페이징 처리 위한 총 프로젝트 수 조회
	 */
	public int listCount(String searching, String sort) {

		Connection conn = null;
		int result =0;
		
		try {
			conn = getConnection();
			
			//sort 를 sql에 맞춤
			if("ongoing".equals(sort)) {sort="I";}
			if("complete".equals(sort)) {sort="S";}
			if("intended".equals(sort)) {sort="B";}
			if(searching != null) {searching = "%" + searching + "%";}
			
			if(searching != null && ("I".equals(sort) || "S".equals(sort) || "B".equals(sort))) {
				result = dao.listCount(conn, searching, sort);
			}else if(searching != null && "all".equals(sort)) {
				result = dao.listCount(conn, searching);
			}else {
				result = new PrjCategoryDao().listCountAll(conn);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
	}

	/*
	 * 프로젝트 불러오기
	 */
	public List<ProjectVo> selectProject(String searching, String sort, PageVo pageVo) {
		List<ProjectVo> projectList = new ArrayList<ProjectVo>();
		Connection conn = null;
		
		try {
			
			conn = getConnection();
			
			//sort 를 sql에 맞춤
			if("ongoing".equals(sort)) {sort="I";}
			if("complete".equals(sort)) {sort="S";}
			if("intended".equals(sort)) {sort="B";}
			if(searching != null) {searching = "%" + searching + "%";}
			
			if(searching == null && sort == null) {
				projectList = new PrjCategoryDao().selectProjectAll(conn, pageVo);
			}else if(sort == null && searching != null) {
				projectList = dao.selectProject(conn, searching, pageVo);
			}else if(searching == null) {
				projectList = dao.selectProjectSort(conn, sort, pageVo);
			}else {
				projectList = dao.selectProject(conn, searching, sort, pageVo);

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return projectList;
	
	}

}
