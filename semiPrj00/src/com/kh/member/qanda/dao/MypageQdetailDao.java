package com.kh.member.qanda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.vo.MypageQdetailVo;
import com.kh.member.vo.MemberVo;

public class MypageQdetailDao {

	public static int insertQdetail(Connection conn, MypageQdetailVo qvo, MemberVo vo) {
		
		String sql ="INSERT INTO MAKER_QUESTION( NO , MEMBER_NO , MAKER_NO , TITLE , CONTENT ) VALUES( SEQ_MAKER_QUESTION_NO.NEXTVAL , ? , ? , ? , ?)";
		
		PreparedStatement pstmt = null;
		int result =0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2, vo.getNo());
			pstmt.setString(3, qvo.getTitle());
			pstmt.setString(4, qvo.getContent());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
