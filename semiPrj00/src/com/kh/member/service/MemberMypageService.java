package com.kh.member.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.repository.MemberMypageDao;
import com.kh.member.vo.MemberVo;

public class MemberMypageService {

	//회원 정보 수정
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

	//회원 정보 조회
	private MemberVo selectOneByNo(String no) {
		
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

	//비밀번호 변경
	public int changePwd(String pwd, String pwdNew, String pwdNew2) {
		
		if(pwdNew.equals(pwdNew2) == false) {
			System.out.println("신규 비밀번호가 일치하지 않음");
			return -1;
		}
		
		if(pwdNew.length() < 4) {
			System.out.println("비밀번호가 4자리 미만임");
			return -2;
		}
		
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			
			result = new MemberMypageDao().changePwd(conn, pwd, pwdNew, pwdNew2);
		}catch(Exception e){
			rollback(conn);
		}finally {
			close(conn);
		}
		
		return result;
		
	}

}
