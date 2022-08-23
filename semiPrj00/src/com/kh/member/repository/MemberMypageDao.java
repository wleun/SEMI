package com.kh.member.repository;

import java.lang.reflect.Executable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.MemberVo;

public class MemberMypageDao {

	//회원 정보 수정
	public int edit(Connection conn, MemberVo vo) {
		
		String sql = "UPDATE MEMBER SET NAME =  ?, NICK =  ?, PHONE =  ?, REGISTRATION = ? WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNick());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getRegistration());
			pstmt.setString(5, vo.getNo());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	//회원 정보 조회
	public MemberVo selectOneByNo(Connection conn, String num) {
		
		String sql = "SELECT * FROM MEMBER WHERE NO = ? AND STATUS = 'A'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("NO");
				String email = rs.getString("EMAIL");
				String name = rs.getString("NAME");
				String nick = rs.getString("NICK");
				String phone = rs.getString("PHONE");
				String type = rs.getString("TYPE");
				String registration = rs.getString("REGISTRATION");
				String mLever = rs.getString("M_LEVEL");
				
				vo = new MemberVo();
				vo.setNo(no);
				vo.setEmail(email);
				vo.setName(name);
				vo.setNick(nick);
				vo.setPhone(phone);
				vo.setType(type);
				vo.setRegistration(registration);
				vo.setmLevel(mLever);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return vo;
		
	}

	//비밀번호 변경
	public int changePwd(Connection conn, String pwd, String pwdNew, String pwdNew2) {
		
		String sql = "UPDATE MEMBER SET PWD = ? WHERE PWD = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwdNew);
			pstmt.setString(2, pwd);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
