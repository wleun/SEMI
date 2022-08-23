package com.kh.main.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.main.repository.MainPageDao;
import com.kh.project.vo.ProjectVo;

public class MainPageService {

	public List<ProjectVo> selectRecommend() {
		Connection conn = getConnection();
		
		List<ProjectVo> recommendList = new MainPageDao().selectRecommend(conn);
		

		return null;
	}

	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProjectVo> selectEalry() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProjectVo> selectDeadline() {
		// TODO Auto-generated method stub
		return null;
	}




}
