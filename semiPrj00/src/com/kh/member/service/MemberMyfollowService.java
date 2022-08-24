package com.kh.member.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.repository.MemberMyfollowDao;
import com.kh.member.vo.MemberMyfollowVo;

public class MemberMyfollowService {

	private final MemberMyfollowDao dao = new MemberMyfollowDao();
	
	public List<MemberMyfollowVo> selectFollow(String no) {
		
		Connection conn = getConnection();
		
		List<MemberMyfollowVo> list = dao.selectFollow(conn, no);
		
		close(conn);
		
		return list;
		
	}

}
