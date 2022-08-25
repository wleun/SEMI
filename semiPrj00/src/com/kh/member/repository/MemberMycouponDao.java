package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.coupon.vo.CouponVo;

public class MemberMycouponDao {

	public List<CouponVo> selectCoupon(Connection conn, String no) {
		
		String sql = "SELECT M.NO, C.MEM_NO, C.NAME, C.DISCOUNT FROM COUPON C INNER JOIN MEMBER M ON M.NO = C.MEM_NO WHERE M.NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CouponVo> list = new ArrayList<CouponVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no1 = rs.getString("NO");
				String memNo = rs.getString("MEM_NO");
				String name = rs.getString("NAME");
				int discount = rs.getInt("DISCOUNT");
				
				CouponVo vo = new CouponVo();
				vo.setNo(no1);
				vo.setMemNo(memNo);
				vo.setName(name);
				vo.setDiscount(discount);
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}

}
