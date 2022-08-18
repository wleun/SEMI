package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.vo.MemberVo;

public class MemberMypageDao {

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
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public MemberVo selectOneByNo(Connection conn, int num) {
		
		String sql = "SELECT * FROM MEMBER WHERE NO = ? AND STATUS = 'A'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int no = rs.getInt("NO");
				String email = rs.getString("EMAIL");
				String name = rs.getString("NAME");
				String nick = rs.getString("NICK");
				String phone = rs.getString("PHONE");
				String registration = rs.getString("REGINSTRATION");
				
				
				ENROLLDATE
				STATUS
				QUIT_DATE
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return vo;
		
	}

}
