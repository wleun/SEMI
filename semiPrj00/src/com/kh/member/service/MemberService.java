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
	public int join(MemberVo addMakerVo) {
		
		Connection conn = null;
		int result = 0;
		//dao 호출(사업자정보 있는지, 없는지로 dao나눔)
		if(addMakerVo.getRegistration() == null) {
			try {
				conn = getConnection();
				
				result = new MemberDao().join(conn, addMakerVo);	
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
		}else {
			try {
				conn = getConnection();
				
				result = new MemberDao().makerJoin(conn, addMakerVo);	
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
	/*
	 * 아이디체크
	 */
	public int idCheck(String userId) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = new MemberDao().idCheck(userId, conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	/*
	 * 이메일 중복검사
	 */
	public int checkEmail(String email) {
		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			result = new MemberDao().checkEmail(conn, email);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	/*
	 * 사업자번호 체크
	 */
	public int busiCheck(int busino) {

		Connection conn = null;
		int result = 0;
		try {
			conn = getConnection();
			
			result = new MemberDao().busiCheck(busino, conn);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	/*
	 * 아이디찾기
	 */
	public String findId(String name, String phone) {
		Connection conn = null;
		String result = null;
		try {
			conn = getConnection();
			result = new MemberDao().findId(conn, name, phone);
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close(conn);
		}
		return result;
	}
	

}
