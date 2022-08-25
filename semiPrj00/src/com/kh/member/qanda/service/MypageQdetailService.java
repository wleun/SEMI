package com.kh.member.qanda.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.dao.MypageQdetailDao;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

public class MypageQdetailService {
	
	private final MypageQdetailDao dao = new MypageQdetailDao();
	
	public int insertQdetail(MypageQdetailVo vo) {
		
		//서비스 로직 필요
		
		
		Connection conn = getConnection();
		int result = dao.insertQdetail(conn, vo);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
