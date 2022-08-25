package com.kh.member.qanda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.qanda.vo.MypageAdetailVo;
import com.kh.member.qanda.vo.MypageQdetailVo;

public class MemberQandADetailDao {

	public List<MypageQdetailVo> selectQdetailList(Connection conn, String no, String makerNo) {
		
		String sql = "SELECT MEMBER_NO, MAKER_NO, TITLE, CONTENT, WRITE_DATE FROM MAKER_QUESTION WHERE MAKER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MypageQdetailVo> list = new ArrayList<MypageQdetailVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, makerNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String memberNo = rs.getString("MEMBER_NO");
				String makerNo1 = rs.getString("MAKER_NO");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writeDate = rs.getString("WRITE_DATE");
				
				MypageQdetailVo vo = new MypageQdetailVo();
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

	public List<MypageAdetailVo> selectAdetailList(Connection conn, String no) {

		String sql = "SELECT TITLE, CONTENT, WRITE_DATE FROM MAKER_ANSWER WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MypageAdetailVo> list = new ArrayList<MypageAdetailVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writeDate = rs.getString("WRITEDATE");
				String no1 = rs.getString("NO");
				
				MypageAdetailVo vo = new MypageAdetailVo();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriteDate(writeDate);
				vo.setNo(no1);
				
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
