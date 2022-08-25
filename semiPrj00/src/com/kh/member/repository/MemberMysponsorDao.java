package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.vo.PageVo;
import com.kh.project.vo.SupportVo;

public class MemberMysponsorDao {
	/*
	 * 후원내역 조회
	 */
	public List<SupportVo> mySponList(PageVo pageVo, String loginNo, Connection conn) {
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM (SELECT * FROM  DONATE_LIST d LEFT OUTER JOIN (SELECT p.NAME P_TITLE, r.NO REARD_NO FROM REWARD r LEFT OUTER JOIN PROJECT p ON r.PROJECT_NO = p.PROJECT_NO) j ON d.REWARD_NO = REWARD_NO WHERE d.MEMBER_NO=?) T ) WHERE RNUM BETWEEN ? AND ?";
		
		List<SupportVo> sponList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			sponList = new ArrayList<SupportVo>();
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String rewardNo = rs.getString("REWARD_NO");
				String memberNo = rs.getString("MEMBER_NO");
				String paymentMethodNo = rs.getString("PAYMENT_METHOD_NO");
				String deliveryAddrNo = rs.getString("DELIVERY_ADDR_NO");
				String donateDate = rs.getString("DONATE_DATE");
				String amount = rs.getString("AMOUNT");
				String quantity = rs.getString("QUANTITY");
				String additional = rs.getString("ADDITIONAL");
				String cancelYn = rs.getString("CANCEL_YN");
				String cancelDate = rs.getString("CANCEL_DATE");
				String projectTitle = rs.getString("P_TITLE");
				
				SupportVo vo = new SupportVo();
				vo.setNo(no);
				vo.setRewardNo(rewardNo);
				vo.setMemberNo(memberNo);
				vo.setPaymentMethodNo(paymentMethodNo);
				vo.setDeliveryAddrNo(deliveryAddrNo);
				vo.setDonateDate(donateDate);
				vo.setAmount(amount);
				vo.setQuantity(quantity);
				vo.setAdditional(additional);
				vo.setCancelYN(cancelYn);
				vo.setCancelDate(cancelDate);
				vo.setProjectNo(projectTitle);
				
				
				sponList.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return sponList;
		
	}
	/*
	 * 총 글수
	 */
	public int getCount(String loginNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(*) CNT FROM  DONATE_LIST d LEFT OUTER JOIN (SELECT p.NAME P_TITLE, r.NO REARD_NO FROM REWARD r LEFT OUTER JOIN PROJECT p ON r.PROJECT_NO = p.PROJECT_NO) j ON d.REWARD_NO = REWARD_NO WHERE d.MEMBER_NO=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, loginNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("CNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

}
