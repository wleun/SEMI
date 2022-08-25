package com.kh.member.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.coupon.vo.CouponVo;
import com.kh.member.repository.MemberMycouponDao;

public class MemberMycouponService {

	private final MemberMycouponDao dao = new MemberMycouponDao();
	
	public List<CouponVo> selectCoupon(String no) {
		
		Connection conn = getConnection();
		
		List<CouponVo> list = dao.selectCoupon(conn, no);
		
		close(conn);
		
		return list;
		
	}

}
