package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.PaymentVo;

public class MemberPaymentDao {

	/*
	 * 결제수단 등록하기
	 */
	public int insertPayment(Connection conn, PaymentVo paymentVo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO PAYMENT_CREDIT_CARD( NO ,MEMBER_NO ,CARD_NUM ,VALID_DATE ,CARD_PWD ,PASSWORD ,BIRTH ,REGISTRATION ,DEFAULT_YN ) VALUES ( SEQ_PAYMENT_NO.NEXTVAL ,? ,? ,? ,? ,? ,? ,? ,? )";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paymentVo.getMemberNo());
			pstmt.setString(2, paymentVo.getCardNum());
			pstmt.setString(3, paymentVo.getValidDate());
			pstmt.setString(4, paymentVo.getCardPwd());
			pstmt.setString(5, paymentVo.getPassword());
			pstmt.setString(6, paymentVo.getBirth());
			pstmt.setString(7, paymentVo.getRegistration());
			pstmt.setString(8, paymentVo.getDefaultYN());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/*
	 * 기존 기본 결제수단 기본설정 해제
	 */
	public int updatePayment(Connection conn, String memberNo) {
		
		String sql = "UPDATE PAYMENT_CREDIT_CARD SET DEFAULT_YN = 'N' WHERE MEMBER_NO = ? AND DEFAULT_YN = 'Y'";
		
		PreparedStatement pstmt = null;
		int update = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			update = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return update;
	}

}//class
