package com.kh.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.ResultSet;

import com.kh.project.repository.ProjectLikeDao;

public class ProjectLikeService {
	
	ProjectLikeDao dao = new ProjectLikeDao();
	
	//좋아요 했는지 체크
	public int projectLikeCheck(String memberNo, String projectNo) {
		
		Connection conn = getConnection();
		
		int result = dao.projectLikeCheck(conn, memberNo, projectNo);
		
		if (result > 0) {
			close(conn);
		}
		System.out.println("컨트롤러에 전달해줄 result 값 (1은 rs없음, 2는 rs 있음):"+result);
		return result;
	}
	
	//프로젝트 좋아요 인서트
	public int projectLikeInsert(String memberNo, String projectNo) {
		
		Connection conn = getConnection();
		
		int result = dao.projectLikeInsert(conn, memberNo, projectNo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		System.out.println("컨트롤러에 전달해줄 result 값 (1이면 좋아요 인서트됨):"+result);
		return result;
	}
	
	//프로젝트 좋아요 업데이트문
	public int projectLikeUpdate(String memberNo, String projectNo) {

		Connection conn = getConnection();
		int result = dao.projectLikeUpdate(conn, memberNo, projectNo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		System.out.println("컨트롤러에 전달해줄 result 값 (1이면 좋아요 업데이트됨):"+result);
		return result;
	}

	//프로젝트 좋아요 취소
	public int projectLikeCancel(String memberNo, String projectNo) {
		
		Connection conn = getConnection();
		
		int result = dao.projectLikeCancel(conn, memberNo, projectNo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		System.out.println("좋아요 취소한 서비스 result 값: "+result);
		return result;
	}


}
