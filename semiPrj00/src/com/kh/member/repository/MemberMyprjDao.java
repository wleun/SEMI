package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.project.vo.ProjectVo;

public class MemberMyprjDao {

	public List<ProjectVo> selectPrj(Connection conn, String[] type) {

		String sql = "SELECT PROJECT_NO, NAME, REGISTER_DATE, THUMBNAIL_PATH, GOAL, STATUS FROM PROJECT  WHERE STATUS = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProjectVo> list = new ArrayList<ProjectVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type[0]);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("PROJECT_NO");
				String name = rs.getString("NAME");
				String rDate = rs.getString("REGISTER_DATE");
				String imgPath = rs.getString("THUMBNAIL_PATH");
				int goal = rs.getInt("GOAL");
				String status = rs.getString("STATUS");
				
				ProjectVo vo = new ProjectVo();
				vo.setPrjectNo(no);
				vo.setName(name);
				vo.setRegisterDate(rDate);
				vo.setThumbnailPath(status);
				vo.setGoal(goal);
				vo.setStatus(status);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public List<ProjectVo> selectPrjAll(Connection conn, String[] type) {
		String sql = "SELECT PROJECT_NO, NAME, REGISTER_DATE, THUMBNAIL_PATH, GOAL, STATUS  FROM PROJECT";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProjectVo> list = new ArrayList<ProjectVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("PROJECT_NO");
				String name = rs.getString("NAME");
				String rDate = rs.getString("REGISTER_DATE");
				String imgPath = rs.getString("THUMBNAIL_PATH");
				int goal = rs.getInt("GOAL");
				String status = rs.getString("STATUS");
				
				ProjectVo vo = new ProjectVo();
				vo.setPrjectNo(no);
				vo.setName(name);
				vo.setRegisterDate(rDate);
				vo.setThumbnailPath(status);
				vo.setGoal(goal);
				vo.setStatus(status);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
