package com.kh.member.qanda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;

public class MemberQandaDao {

	public List<MypageQdetailVo> selectQList(Connection conn, String no) {

		String sql = "SELECT M.NICK NICK, Q.WRITE_DATE WRITE_DATE FROM MAKER_QUESTION Q JOIN MEMBER M ON Q.MAKER_NO = M.NO WHERE Q.MEMBER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MypageQdetailVo> list = new ArrayList<MypageQdetailVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String nick = rs.getString("NICK");
				String writeDate = rs.getString("WRITE_DATE");
				
				MypageQdetailVo vo = new MypageQdetailVo();
				vo.setMakerNo(nick);
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

	public List<MypageAdetailVo> selectAList(Connection conn, String no) {
		
		String sql = "SELECT M.NICK NICK FROM MAKER_ANSWER A JOIN MAKER_QUESTION Q ON A.MAKER_QUESTION_NO = Q.NO JOIN MEMBER M ON M.NO = Q.MEMBER_NO WHERE Q.MAKER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MypageAdetailVo> list = new ArrayList<MypageAdetailVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String nick = rs.getString("NICK");
				
				MypageAdetailVo vo = new MypageAdetailVo();
				vo.setMakerQuestionNo(nick);
				
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

}
