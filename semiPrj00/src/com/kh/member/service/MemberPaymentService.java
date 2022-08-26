package com.kh.member.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.repository.MemberPaymentDao;
import com.kh.member.vo.PaymentVo;

public class MemberPaymentService {
	
	private final MemberPaymentDao dao = new MemberPaymentDao();

	/*
	 * 결제수단 등록
	 */
	public int insertPayment(PaymentVo paymentVo) {
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			if(paymentVo.getDefaultYN() == null) {
				paymentVo.setDefaultYN("N");
			}else {
				paymentVo.setDefaultYN("Y");
			}
			
			if(paymentVo.getCardNum()==null || paymentVo.getValidDate()==null || paymentVo.getCardPwd()==null || paymentVo.getPassword()==null){
				result = -1;
			}else if(paymentVo.getCardNum().length()<16 || paymentVo.getCardPwd().length()<2 || paymentVo.getPassword().length()<6) {
				result = -2;
			}else {
				result = dao.insertPayment(conn, paymentVo);
				
				if(result == 1) {
					commit(conn);
				}else {
					System.out.println("error result ::: " + result);
					rollback(conn);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			rollback(conn);
		}finally {
			close(conn);
		}
		
		return result;
	}

	/*
	 * 기본 결제수단 삭제
	 */
	public int updatePayment(String memberNo) {
		Connection conn = null;
		int update = 0;
		
		try {
			conn = getConnection();
			
			if(memberNo != null) {
				update = dao.updatePayment(conn, memberNo);
				if(update > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			}else {
				update = -1;
				System.out.println("error update ::: " + update);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			rollback(conn);
		}finally {
			close(conn);
		}
		
		return update;
	}


}//class
