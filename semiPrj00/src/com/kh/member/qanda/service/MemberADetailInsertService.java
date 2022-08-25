package com.kh.member.qanda.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.member.qanda.dao.MemberADetailInsertDao;
import com.kh.member.qanda.vo.MypageAdetailVo;

public class MemberADetailInsertService {
	
	private final MemberADetailInsertDao dao = new MemberADetailInsertDao();
	
	public int qInsert(MypageAdetailVo vo) {
		Connection conn = getConnection();
		int result = dao.qInsert(conn, vo);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
