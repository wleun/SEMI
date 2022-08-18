package com.kh.member.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.repository.MemberDao;
import com.kh.member.vo.MemberVo;

public class MemberService {
	/*
	 * 로그인
	 */
	public MemberVo login(String email, String pwd) {
		//dao 호출
		Connection conn = null;
		MemberVo loginMember = null;
		
		try {
			conn= getConnection();
			
			loginMember = new MemberDao().login(conn, email, pwd);			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return loginMember; 
		
		
	}
	/*
	 * 회원가입
	 */
	public int join(MemberVo memberVo) {
		
		Connection conn = null;
		int result = 0;
		//dao 호출
		try {
			conn = getConnection();
			
			result = new MemberDao().join(conn, memberVo);	
			if(result == 1) {
				//회원가입 성공
				commit(conn);
			}else {
				//회원가입 실패
				rollback(conn);
			}
		}catch(Exception e) {
			e.printStackTrace();
			rollback(conn);
		}finally {
			close(conn);
		}
		return result;
		
	}

}
