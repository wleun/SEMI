package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.kh.category.vo.CategoryVo;
import com.kh.project.attachment.vo.ProjectAttachmentVo;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

import static com.kh.common.JDBCTemplate.*;

public class PrjOpenDao {


	//카테고리 조회
	public List<CategoryVo> selectCategoryList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CategoryVo> list = new ArrayList<CategoryVo>();
		
		String sql = "SELECT CATEGORY_NO, NAME FROM CATEGORY";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CategoryVo(rs.getString("CATEGORY_NO"), rs.getString("NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
		
				
	}

	public int insertProject(Connection conn, ProjectVo prjVo) throws Exception{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO PROJECT(PROJECT_NO, CATEGORY_NO, NAME, START_DATE, END_DATE, GOAL, MAKER_NO, TEXT, ACCOUNT_NO, SHIPPING_DATE, THUMBNAIL_NAME, THUMBNAIL_PATH, ETC, ACCOUNT_BANK, ACCOUNT_NAME, MAKER_INFO) "
				+ "VALUES(SEQ_PROJECT_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prjVo.getCategoryNo());
			pstmt.setString(2, prjVo.getName());
			pstmt.setString(3, prjVo.getStartDate());
			pstmt.setString(4, prjVo.getEndDate());
			pstmt.setInt(5, prjVo.getGoal());
			pstmt.setString(6, prjVo.getMakerNo());
			pstmt.setString(7, prjVo.getText());
			pstmt.setString(8, prjVo.getAccountNo());
			pstmt.setString(9, prjVo.getShippingDate());
			pstmt.setString(10, prjVo.getThumbnailName());
			pstmt.setString(11, prjVo.getThumbnailPath());
			pstmt.setString(12, prjVo.getEtc());
			pstmt.setString(13, prjVo.getAccountBank());
			pstmt.setString(14, prjVo.getAccountName());
			pstmt.setString(15, prjVo.getMakerInfo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
		
		
		
	}

	public int insertProjectFile(Connection conn, LinkedList<ProjectAttachmentVo> attList) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertProjectReward(Connection conn, LinkedList<ProjectRewardVo> rewardList) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
