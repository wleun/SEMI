package com.kh.admin.proposal.repository;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.common.vo.PageVo;
import com.kh.member.vo.MemberVo;
import com.kh.project.vo.ProjectVo;

public class AdminProposalDao {

	public int getCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM PROJECT";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public List<ProjectVo> selectList(Connection conn, PageVo pageVo) {
		
		
		List<ProjectVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql= "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT NO , TYPE , M_LEVEL , NICK , EMAIL , PHONE , STATUS , ENROLL_DATE , SUSPEND_DATE , QUIT_DATE FROM MEMBER ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		
		try {
				int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
				int end = start + pageVo.getBoardLimit() - 1;
				
				pstmt= conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				list = new ArrayList<ProjectVo>();
			
				while(rs.next()) {
					
					ProjectVo vo = new ProjectVo();
//					
//					String no = rs.getString("PROJECT_NO");
//					String nick = rs.getString("NICK");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
//					String no = rs.getString("PROJECT_NO");
					
//					
//				    이름 NAME 
//			            회원 이름(닉) ( 회원 테이블 조인)
//				    프로젝트 카테고리 CATEGORY_NO (카테고리 조인)
//			            접수 날짜 REGISTER_DATE
//				    상태 STATUS R=접수, N=반려, A=검토중 B,I,S,F = 승인, D = 삭제
//			            프로젝트 시작일 START_DATE
//			            프로젝트 마감일 END_DATE
//			            프로젝트 목표금액 GOAL NUMBER
//			            배송일 SHIPPING_DATE
//			            설명 TEXT
//				    썸네일 이름 THUMBNAIL_NAME
//			            썸네일 주소 THUMBNAIL_PATH
				
				}
			
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn);
				close(pstmt);
			}
		
		
			return list;

	}
	
}	
