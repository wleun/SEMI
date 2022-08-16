package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProjectDao {

	//플젝 좋아요
	public int projectLike(Connection conn) {

		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			pstmt = conn.prepareStatement(sql);

		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
