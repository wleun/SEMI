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


	//카테고리 select
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

	//프로젝트 정보 insert
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

	//첨부파일 insert
	public int insertProjectFile(Connection conn, LinkedList<ProjectAttachmentVo> attList) throws Exception {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO DESCRIPTION_FILE(NO, PROJECT_NO, FILE_SRC, ORIGIN_NAME, CHANGE_NAME) "
				+ "VALUES(SEQ_DESCRIPTION_NO.NEXTVAL, SEQ_PROJECT_NO.CURRVAL, ?, ?, ?)";
		
		try {
			
			for(int i = 0; i < attList.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, attList.get(i).getFileSrc());
				pstmt.setString(2, attList.get(i).getOriginName());
				pstmt.setString(3, attList.get(i).getChangeName());
				
				result = pstmt.executeUpdate();

			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			close(pstmt);
		}
		
		return result;
			
	}

	
	//리워드 insert
	public int insertProjectReward(Connection conn, LinkedList<ProjectRewardVo> rewardList) throws Exception {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO REWARD(NO, PROJECT_NO, \"OPTION\", DETAIL, PRICE, QUANTITY) "
				+ "VALUES(SEQ_REWARD_NO.NEXTVAL, SEQ_PROJECT_NO.CURRVAL, ?, ?, ?, ?)";
		
		try {
			
			for(int i = 0; i < rewardList.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, rewardList.get(i).getOption());
				pstmt.setString(2, rewardList.get(i).getDetail());
				pstmt.setString(3, rewardList.get(i).getPrice());
				pstmt.setString(4, rewardList.get(i).getQuantity());
				
				result = pstmt.executeUpdate();

			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			close(pstmt);
		}
		
		return result;
			
	}
	

}
