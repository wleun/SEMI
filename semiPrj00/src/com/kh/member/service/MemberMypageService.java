package com.kh.member.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.repository.MemberMypageDao;
import com.kh.member.vo.MemberVo;

public class MemberMypageService {

	public MemberVo edit(MemberVo vo) {
		
		Connection conn = null;
		int result = 0;
		MemberVo updateVo = null;
		
		try {
			conn = getConnection();
			result = new MemberMypageDao().edit(conn, vo);
			
			if(result == 1) {
				commit(conn);
				updateVo = selectOneByNo(vo.getNo());
			}else {
				rollback(conn);
			}
		}catch(Exception e) {
			rollback(conn);
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return updateVo;
		
	}

	private MemberVo selectOneByNo(int no) {
		
		Connection conn = null;
		MemberVo vo = null;
		
		try {
			conn = getConnection();
			vo = new MemberMypageDao().selectOneByNo(conn, no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return vo;
		
	}

}
