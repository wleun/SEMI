package com.kh.member.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.coupon.vo.CouponVo;
import com.kh.member.repository.MemberMylikeDao;
import com.kh.member.vo.ProjectLikeVo;

public class MemberMylikeService {

	private final MemberMylikeDao dao = new MemberMylikeDao();
 	
	public List<ProjectLikeVo> selectList(String no) {
		
		Connection conn = getConnection();
		
		List<ProjectLikeVo> list = dao.selectList(conn, no);
		
		close(conn);
		
		return list;
	}

	
	
	
}
