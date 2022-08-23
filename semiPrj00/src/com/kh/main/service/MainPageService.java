package com.kh.main.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.main.repository.MainPageDao;
import com.kh.project.vo.ProjectVo;

public class MainPageService {

	//추천
	public List<ProjectVo> selectRecommend() {
		Connection conn = null;
		List<ProjectVo> recommendList = null;
		
		try {
			conn = getConnection();
			recommendList = new MainPageDao().selectRecommend(conn);
		} catch (Exception e) {
			System.out.println("추천 항목을 가져오는데 에러 발생");
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return recommendList;
	}

	

	//얼리버드
	public List<ProjectVo> selectEarly() {
		Connection conn = null;
		List<ProjectVo> earlyList = null;
		
		try {
			conn = getConnection();
			earlyList = new MainPageDao().selectEarly(conn);
		} catch (Exception e) {
			System.out.println("얼리버드 항목을 가져오는데 에러 발생");
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return earlyList;
	}

	
	//마감임박
	public List<ProjectVo> selectDeadline() {
		Connection conn = null;
		List<ProjectVo> deadLineList = null;
		
		try {
			conn = getConnection();
			deadLineList = new MainPageDao().selectDeadline(conn);
		} catch (Exception e) {
			System.out.println("마감임박 항목을 가져오는데 에러 발생");
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return deadLineList;
	}






}
