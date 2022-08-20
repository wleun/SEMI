package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import static com.kh.common.JDBCTemplate.*;

public class ProjectLikeDao {

	//좋아요 체크
	public int projectLikeCheck(Connection conn, String memberNo, String projectNo) {

		String sql = "SELECT * FROM PROJECT_LIKE WHERE MEMBER_NO = ? AND PROJECT_NO = ?"; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		System.out.println("dao까지 왔나?");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, projectNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = 1;
			}
			else if(!rs.next()) {
				result = 2;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("서비스에 전달해줄 result 값 (1은 rs없음, 2는 rs 있음):"+result);
		return result;
	}
	
	//플젝 좋아요 인서트
	public int projectLikeInsert(Connection conn, String memberNo, String projectNo) {

		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO PROJECT_LIKE (NO, MEMBER_NO, PROJECT_NO, STATUS) VALUES (SEQ_PROJECT_LIKE_NO.NEXTVAL, ?, ?, 'L')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, projectNo);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		close(pstmt);
		System.out.println("서비스에 전달해줄 좋아요 인서트 result 값: "+result);
		return result;
	}
	
	//좋아요 업데이트문
	public int projectLikeUpdate(Connection conn, String memberNo, String projectNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE PROJECT_LIKE SET STATUS = 'L' WHERE MEMBER_NO = ? AND PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, projectNo);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		close(pstmt);
		System.out.println("서비스에 전달해줄 좋아요 업데이트 result 값: "+result);
		return result;
	}

	//좋아요 취소
	public int projectLikeCancel(Connection conn, String memberNo, String projectNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE PROJECT_LIKE SET STATUS = 'N' WHERE MEMBER_NO = ? AND PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, projectNo);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		close(pstmt);
		System.out.println("좋아요 취소한 dao result 값: "+result);
		return result;
	}



}
