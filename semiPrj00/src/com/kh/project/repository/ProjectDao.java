package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProjectDao {

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
		
		
		return result;
	}

}
