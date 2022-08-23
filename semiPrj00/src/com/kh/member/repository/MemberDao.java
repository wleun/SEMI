package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.MemberVo;

public class MemberDao {
	/*
	 * 로그인
	 */
	public MemberVo login(Connection conn, String email, String pwd) {
		// conn준비
		//SQL 준비
		String sql = "SELECT * FROM MEMBER WHERE EMAIL = ? AND PWD = ? AND STATUS = 'A'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo loginMember = null;
		//SQL 객체 담기 및 실행
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			//결과 가져오기
			if(rs.next()) {
				String no = rs.getString("NO");
				String name = rs.getString("NAME");
				String memEmail = rs.getString("EMAIL");
				String nick = rs.getString("NICK");
				String memPwd = rs.getString("PWD");
				String phone = rs.getString("PHONE");
				String type = rs.getString("TYPE");
				String registration = rs.getString("REGISTRATION");
				Timestamp enrollDate = rs.getTimestamp("ENROLL_DATE");
				String status = rs.getString("STATUS");
				Timestamp quitDate = rs.getTimestamp("QUIT_DATE");
				String mLevel = rs.getString("M_LEVEL");
				Timestamp supendDate = rs.getTimestamp("SUSPEND_DATE");
				String code = rs.getString("CODE");
				
				
				loginMember = new MemberVo();
				loginMember.setNo(no);
				loginMember.setName(name);
				loginMember.setEmail(memEmail);
				loginMember.setNick(nick);
				loginMember.setPwd(memPwd);
				loginMember.setPhone(phone);
				loginMember.setType(type);
				loginMember.setRegistration(registration);
				loginMember.setEnrolldate(enrollDate);
				loginMember.setStatus(status);
				loginMember.setQuitDate(quitDate);
				loginMember.setmLevel(mLevel);
				loginMember.setSuspendDate(supendDate);
				loginMember.setCode(code);
			}
			//결과 객체에 담기
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		//객체 리턴
		return loginMember;
	
	}
	/*
	 * 회원가입
	 */
	public int join(Connection conn, MemberVo addMakerVo) {
		//conn준비
		
		//sql 준비
		String sql = "INSERT INTO MEMBER (NO ,NAME ,EMAIL ,NICK ,PWD ,PHONE ,CODE ) VALUES (SEQ_MEMBER_NO.NEXTVAL,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			//sql 객체 담기 및 실행
			pstmt.setString(1, addMakerVo.getName());
			pstmt.setString(2, addMakerVo.getEmail());
			pstmt.setString(3, addMakerVo.getNick());
			pstmt.setString(4, addMakerVo.getPwd());
			pstmt.setString(5, addMakerVo.getPhone());
			pstmt.setString(6, addMakerVo.getCode());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	public int makerJoin(Connection conn, MemberVo addMakerVo) {
		//conn준비
		
				//sql 준비
				String sql = "INSERT INTO MEMBER (NO ,NAME ,EMAIL ,NICK ,PWD ,PHONE ,CODE ,TYPE ,REGISTRATION ,M_LEVEL ) VALUES (SEQ_MEMBER_NO.NEXTVAL ,?,?,?,?,?,?,?,?,'브론즈')";
				
				PreparedStatement pstmt = null;
				int result = 0;
				try {
					pstmt = conn.prepareStatement(sql);
					//sql 객체 담기 및 실행
					pstmt.setString(1, addMakerVo.getName());
					pstmt.setString(2, addMakerVo.getEmail());
					pstmt.setString(3, addMakerVo.getNick());
					pstmt.setString(4, addMakerVo.getPwd());
					pstmt.setString(5, addMakerVo.getPhone());
					pstmt.setString(6, addMakerVo.getCode());
					pstmt.setString(7, addMakerVo.getType());
					pstmt.setString(8, addMakerVo.getRegistration());
					
					result = pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
				return result;
	}
	/*
	 * 아이디체크
	 */
	public int idCheck(String userId, Connection conn) {
		//conn준비
		//sql
		String sql = "SELECT COUNT(NO) AS COUNT FROM MEMBER WHERE NICK = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
		
		
	}
	/*
	 * 이메일 중복검사
	 */
	public int checkEmail(Connection conn, String email) {
		String sql = "SELECT STATUS FROM MEMBER WHERE EMAIL = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String result_ = rs.getString("STATUS");
				if(result_.equals("A")) {
					result = 1;
				}else if(result_.equals("S")) {
					result = 2;
				}else if(result_.equals("Q")) {
					result = 3;
				}
			}else {
				result = 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
		
	}
	/*
	 * 사업자번호체크
	 */
	public int busiCheck(int busino, Connection conn) {
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM MEMBER WHERE REGISTRATION = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, busino);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	/*
	 * 아이디찾기
	 */
	public String findId(Connection conn, String name, String phone) {
		String sql = "SELECT EMAIL FROM MEMBER WHERE NAME = ? AND PHONE = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("EMAIL");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

}
