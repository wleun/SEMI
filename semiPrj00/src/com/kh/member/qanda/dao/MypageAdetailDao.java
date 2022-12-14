package com.kh.member.qanda.dao;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;

public class MypageAdetailDao {

	public List<MypageQdetailVo> selectQdetailList(Connection conn, String no, String makerNo) {
		
		String sql = "SELECT NO, MEMBER_NO, MAKER_NO, TITLE, CONTENT, WRITE_DATE FROM MAKER_QUESTION WHERE MAKER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MypageQdetailVo> list = new ArrayList<MypageQdetailVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, makerNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no1 = rs.getString("NO");
				String memberNo = rs.getString("MEMBER_NO");
				String makerNo1 = rs.getString("MAKER_NO");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writeDate = rs.getString("WRITE_DATE");
				
				MypageQdetailVo vo = new MypageQdetailVo();
				vo.setNo(no1);
				vo.setMemberNo(memberNo);
				vo.setMakerNo(makerNo1);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriteDate(writeDate);
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}

	public int insertAdetail(Connection conn, MypageAdetailVo vo, String no) {
		
		String sql = "INSERT INTO MAKER_ANSWER( NO , MAKER_QUESTION_NO , TITLE , CONTENT ) VALUES( SEQ_MAKER_ANSWER_NO.NEXTVAL , ? , ? , ? )";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMakerQuestionNo());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			System.out.println(vo);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
