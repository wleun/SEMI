package com.kh.project.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.addr.vo.AddrVo;
import com.kh.coupon.vo.CouponVo;
import com.kh.member.vo.PaymentVo;
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

	public List<AddrVo> selectAddr(Connection conn, String memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AddrVo> addrList = new ArrayList<AddrVo>();
		
		String sql = "SELECT * FROM DELIVERY_ADDRESS WHERE MEMBER_NO = ? ORDER BY DEFAULT_YN DESC";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AddrVo vo = new AddrVo();
				vo.setNo(rs.getString("NO"));
				vo.setPostNum(rs.getString("POST_NUM"));
				vo.setAddr1(rs.getString("ADDR1"));
				vo.setAddr2(rs.getString("ADDR2"));
				vo.setName(rs.getString("NAME"));
				vo.setPhone(rs.getString("PHONE"));
				
				String defaultAddr = rs.getString("DEFAULT_YN");
				if("N".equals(defaultAddr)) {
					vo.setDefaultYN(null);
				}else {
					vo.setDefaultYN("checked");
				}
				addrList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return addrList;
	}

	/*
	 * 결제수단 가져오기
	 */
	public List<PaymentVo> selectPayment(Connection conn, String memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentVo> paymentList = new ArrayList<PaymentVo>();
		
		String sql = "SELECT * FROM PAYMENT_CREDIT_CARD WHERE MEMBER_NO = ? ORDER BY DEFAULT_YN DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PaymentVo vo = new PaymentVo();
				vo.setNo(rs.getString("NO"));
				vo.setNo(rs.getString("PASSWORD"));
				
				String cardNum = rs.getString("CARD_NUM");
				cardNum = cardNum.substring(12);
				vo.setCardNum(cardNum);
				
				String defaultAddr = rs.getString("DEFAULT_YN");
				if("N".equals(defaultAddr)) {
					vo.setDefaultYN(null);
				}else {
					vo.setDefaultYN("checked");
				}
				paymentList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return paymentList;
	}

	/*
	 * 쿠폰 가져오기
	 */
	public List<CouponVo> selectCoupon(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CouponVo> couponList = new ArrayList<CouponVo>();
		
		String sql = "SELECT * FROM COUPON WHERE MEM_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponVo vo = new CouponVo();
				
				vo.setNo(rs.getString("NO"));
				vo.setName(rs.getString("NAME"));
				vo.setDiscount(rs.getInt("DISCOUNT"));
				
				couponList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		
		return couponList;
	}

}
