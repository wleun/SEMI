package com.kh.member.qanda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.vo.MypageAdetailVo;

public class MemberADetailInsertDao {

	public int qInsert(Connection conn, MypageAdetailVo vo) {

		String sql = "INSERT INTO MAKER_ANSWER (NO, MAKER_QUESTION_NO, TITLE, CONTENT) VALUES (SEQ_MAKER_ANSWER_NO.NEXTVAL, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMakerQuestionNo());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
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
