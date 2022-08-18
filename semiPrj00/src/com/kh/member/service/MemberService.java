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
//	public int join(MemberVo memberVo) {
//		//이메일 중복검사**나중에
//		//닉네임 중복검사**나중에
//		//dao호출
//	}

}
