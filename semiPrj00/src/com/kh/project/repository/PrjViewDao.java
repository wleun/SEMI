package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

public class PrjViewDao {

	//번호에 해당하는 플젝 조회해오기
	public ProjectVo selectProject(Connection conn, String prjNum) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProjectVo pvo = null;
		
		String sql = "SELECT P.PROJECT_NO, C.NAME AS CATEGORY_NO, P.NAME, TO_CHAR(P.REGISTER_DATE,'YY/MM/DD') AS REGISTER_DATE, P.START_DATE, P.END_DATE, TO_CHAR(P.GOAL,'99,999,999,999') AS GOAL, M.NICK AS MAKER_NO, P.TEXT, P.ACCOUNT_NO, P.SHIPPING_DATE, P.THUMBNAIL_NAME, P.THUMBNAIL_PATH, P.ETC, P.ACCOUNT_BANK, P.ACCOUNT_NAME, P.MAKER_INFO, P.STATUS FROM PROJECT P JOIN CATEGORY C ON P.CATEGORY_NO = C.CATEGORY_NO JOIN MEMBER M ON P.MAKER_NO = M.NO WHERE P.PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String projectNo = rs.getString("PROJECT_NO");
				String categoryNo = rs.getString("CATEGORY_NO");
				String name = rs.getString("NAME");
				String registerDate = rs.getString("REGISTER_DATE");
				String startDate = rs.getString("START_DATE");
				String endDate = rs.getString("END_DATE");
				int goal = rs.getInt("GOAL");
				String makerNo = rs.getString("MAKER_NO");
				String text = rs.getString("TEXT");
				String accountNo = rs.getString("ACCOUNT_NO");
				String shippingDate = rs.getString("SHIPPING_DATE");
				String thumbnailName = rs.getString("THUMBNAIL_NAME");
				String thumbnailPath = rs.getString("THUMBNAIL_PATH");
				String etc = rs.getString("ETC");
				String accountBank = rs.getString("ACCOUNT_BANK");
				String accountName = rs.getString("ACCOUNT_NAME");
				String makerInfo = rs.getString("MAKER_INFO");
				String status = rs.getString("STATUS");
				
				pvo = new ProjectVo();
				pvo.setPrjectNo(projectNo);
				pvo.setCategoryNo(categoryNo);
				pvo.setName(name);
				pvo.setRegisterDate(registerDate);
				pvo.setStartDate(startDate);
				pvo.setEndDate(endDate);
				pvo.setGoal(goal);
				pvo.setMakerNo(makerNo);
				pvo.setText(text);
				pvo.setAccountNo(accountNo);
				pvo.setShippingDate(shippingDate);
				pvo.setThumbnailName(thumbnailName);
				pvo.setThumbnailPath(thumbnailPath);
				pvo.setEtc(etc);
				pvo.setAccountBank(accountBank);
				pvo.setAccountName(accountName);
				pvo.setMakerInfo(makerInfo);
				pvo.setStatus(status);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return pvo;
	}

	//리워드 옵션 조회해오기
	public List<ProjectRewardVo> selectReward(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProjectRewardVo> list = new ArrayList<ProjectRewardVo>();
		
		String sql = "SELECT NO,\"OPTION\",DETAIL,TO_CHAR(PRICE, '999,999') AS PRICE,QUANTITY FROM REWARD WHERE PROJECT_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prjNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String no = rs.getString("NO");
				String optionName = rs.getString("\"OPTION\"");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String quantity = rs.getString("QUANTITY");
				
				ProjectRewardVo rvo = new ProjectRewardVo();
				rvo.setNo(no);
				rvo.setOption(optionName);
				rvo.setDetail(detail);
				rvo.setPrice(price);
				rvo.setQuantity(quantity);
				
				list.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

	public void getTotalDonation(Connection conn, String prjNum) {
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
