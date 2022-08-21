package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.kh.common.JDBCTemplate.*;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

public class PrjSupportDao {

	/*
	 * 번호로 프로젝트 조회하기
	 */
	public ProjectVo selectPrj(Connection conn, String num) {
		
		String sql = "SELECT P.*, C.NAME CATEGORY_NAME FROM PROJECT P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO WHERE P.PROJECT_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProjectVo prjVo = new ProjectVo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				prjVo.setCategoryNo(rs.getString("CATEGORY_NAME"));
				prjVo.setName(rs.getString("NAME"));
				prjVo.setEndDate(rs.getString("END_DATE"));
				prjVo.setGoal(rs.getInt("GOAL"));
				prjVo.setShippingDate(rs.getString("SHIPPING_DATE"));
				prjVo.setThumbnailName(rs.getString("THUMBNAIL_NAME"));
				prjVo.setThumbnailPath(rs.getString("THUMBNAIL_PATH"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return prjVo;
	}

	public ProjectRewardVo selectReward(Connection conn, String reward) {
		
		String sql = "SELECT * FROM REWARD WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProjectRewardVo rewardVo = new ProjectRewardVo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reward);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rewardVo.setNo(reward);
				rewardVo.setProjectNo(rs.getString("PROJECT_NO"));
				rewardVo.setOption(rs.getString("OPTION"));
				rewardVo.setDetail(rs.getString("DETAIL"));
				rewardVo.setPrice(rs.getString("PRICE"));
				rewardVo.setQuantity(rs.getString("QUANTITY"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
				
		return rewardVo;
	}

}
