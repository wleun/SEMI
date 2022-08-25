package com.kh.member.qanda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

public class MypageQdetailDao {

	public int insertQdetail(Connection conn, MypageQdetailVo vo) {

		String sql = "INSERT INTO MAKER_QUESTION ( NO ,MEMBER_NO ,MAKER_NO ,TITLE ,CONTENT ) VALUES ( SEQ_MAKER_QUESTION_NO.NEXTVAL ,? ,? ,? ,? )";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMemberNo());
			pstmt.setString(2, vo.getMakerNo());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			System.out.println(vo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

}
