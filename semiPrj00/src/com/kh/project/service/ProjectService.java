package com.kh.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.project.repository.ProjectDao;

public class ProjectService {
	
	ProjectDao dao = new ProjectDao();

	//프로젝트 좋아요
	public int projectLike() {
		
		Connection conn = getConnection();
		
		int result = dao.projectLike(conn);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	//프로젝트 좋아요 취소
	public void projectLikeCancel() {
		
	}

}
