package com.kh.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kh.addr.vo.AddrVo;
import static com.kh.common.JDBCTemplate.*;

public class MemberAddrDao {

	public int insertAddr(Connection conn, AddrVo addrVo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "INSERT INTO DELIVERY_ADDRESS ( NO ,MEMBER_NO ,POST_NUM ,ADDR1 ,ADDR2 ,NAME ,PHONE ,DEFAULT_YN ) VALUES ( SEQ_ADDR_NO.NEXTVAL ,? ,? ,? ,? ,? ,? ,? )";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, addrVo.getMemberNo());
			pstmt.setString(2, addrVo.getPostNum());
			pstmt.setString(3, addrVo.getAddr1());
			pstmt.setString(4, addrVo.getAddr2());
			pstmt.setString(5, addrVo.getName());
			pstmt.setString(6, addrVo.getPhone());
			pstmt.setString(7, addrVo.getDefaultYN());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAddr(Connection conn, String memberNo) {
		
		PreparedStatement pstmt = null;
		int update = 0;
		
		String sql = "UPDATE DELIVERY_ADDRESS SET DEFAULT_YN = 'N' WHERE MEMBER_NO = ? AND DEFAULT_YN = 'Y'";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			
			update = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return update;
	}

}
