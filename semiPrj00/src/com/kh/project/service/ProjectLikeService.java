package com.kh.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.project.repository.ProjectLikeDao;

public class ProjectLikeService {
	
	ProjectLikeDao dao = new ProjectLikeDao();

	//프로젝트 좋아요
	public int projectLike() {
		
		Connection conn = getConnection();
		
		
		int result = dao.projectLike(conn);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		System.out.println("좋아요 한 서비스 result 값: "+result);
		return result;
	}

	//프로젝트 좋아요 취소
	public int projectLikeCancel() {
		Connection conn = getConnection();
		
		int result = dao.projectLikeCancel(conn);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		System.out.println("좋아요 취소한 서비스 result 값: "+result);
		return result;
	}

}
