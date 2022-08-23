package com.kh.member.qanda.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.dao.MypageQdetailDao;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

public class MypageQdetailService {

	//문의글 작성
	public int insertQdetail(MypageQdetailVo qvo, MemberVo vo) {
		if(qvo.getTitle().length() < 1) {
			System.out.println("제목을 작성하지 않음");
			return -1;
		}
		
		if(qvo.getContent().length() < 1) {
			System.out.println("내용을 작성하지 않음");
			return -2;
		}
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = MypageQdetailDao.insertQdetail(conn, qvo, vo);
		}catch(Exception e) {
			rollback(conn);
		}finally {
			close(conn);
		}

		return result;
	}

}
