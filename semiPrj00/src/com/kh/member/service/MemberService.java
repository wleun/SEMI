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
	/*
	 * 비번찾기 인증
	 */
	public int findPwd(String email, String phone) {
		Connection conn = null;
		int result = 0;
		
		try {
			conn = getConnection();
			result = new MemberDao().findPwd(conn, email, phone);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	/*
	 * 비번변경
	 */
	public int updatePwd(String email, String phone, String pwd, String pwd2) {
		//서비스 로직
		if(pwd.length() < 4) {
			System.out.println("비번 4자리 미만");
			return -1;
		}
		if(pwd.equals(pwd2)==false) {
			System.out.println("비번, 확인비번 다름");
			return -1;
		}
		
		Connection conn = null;
		int result = 0;
		try {
		conn = getConnection();
		//dao호출
		result = new MemberDao().updatePwd(conn, email, phone , pwd);
		
		if(result == 1) {
			commit(conn);
			System.out.println("업데이트 완료");
		}else {
			rollback(conn);
			System.out.println("업데이트 실패");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			rollback(conn);
		}finally {
			close(conn);
		}
		return result;
		
	}
	/*
	 * 회원탈퇴
	 */
	public int quit(String no, String pwd, String pwd1) {
		
		//서비스로직
		if(!(pwd.equals(pwd1))) {
			return -1;
		}
		
		Connection conn = null;
		int result = 0;
		
		
		try {
			conn= getConnection();
			result = new MemberDao().quit(conn, no);
			if(result == 1) {
				commit(conn);
			}else {
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
