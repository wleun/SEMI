package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static com.kh.common.JDBCTemplate.*;

public class ProjectLikeDao {

	//플젝 좋아요
	public int projectLike(Connection conn) {

		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO PROJECT_LIKE (NO, MEMBER_NO, PROJECT_NO, STATUS) VALUES (SEQ_PROJECT_LIKE_NO.NEXTVAL, 1, 1, 'L')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}

	//좋아요 취소
	public int projectLikeCancel(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE PROJECT_LIKE SET STATUS = 'N' WHERE MEMBER_NO = 1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		close(pstmt);
		System.out.println("좋아요 취소한 dao result 값: "+result);
		return result;
	}

}
