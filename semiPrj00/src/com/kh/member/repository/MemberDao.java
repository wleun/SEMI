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
				int no = rs.getInt("NO");
				String name = rs.getString("NAME");
				String memEmail = rs.getString("EMAIL");
				String nick = rs.getString("NICK");
				String memPwd = rs.getString("PWD");
				String phone = rs.getString("PHONE");
				String type = rs.getString("TYPE");
				String registration = rs.getString("REGISTRATION");
				Timestamp enrollDate = rs.getTimestamp("ENROLLDATE");
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
	public int join(Connection conn, MemberVo memberVo) {
		//conn준비
		
		//sql 준비
		String sql = "INSERT INTO MEMBER (NO ,NAME ,EMAIL ,NICK ,PWD ,PHONE ,CODE ) VALUES (SEQ_MEMBER_NO.NEXTVAL,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			//sql 객체 담기 및 실행
			pstmt.setString(1, memberVo.getName());
			pstmt.setString(2, memberVo.getEmail());
			pstmt.setString(3, memberVo.getNick());
			pstmt.setString(4, memberVo.getPwd());
			pstmt.setString(5, memberVo.getPhone());
			pstmt.setString(6, memberVo.getCode());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

}
