package com.kh.memberNotice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;

import static com.kh.common.JDBCTemplate.*;

public class NoticeDao {
	//총 페이지 구하기
	public int getCount(Connection conn) {
		//Connection준비완
		
		//SQL
		String sql = "SELECT COUNT(NO) AS COUNT FROM NOTICE WHERE DELETE_YN = 'N'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return count;
	}
	/*
	 * 현제페이지 목록 조회
	 */
	public List<AdminNoticeVo> selectList(Connection conn, PageVo pageVo) {
		//conn준비
		
		//sql준비
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT N.NO , A.NAME , N.TITLE , N.CONTENT , N.THUMBNAIL_PATH , N.THUMBNAIL_NAME , N.WRITE_DATE , N.IMPORTANT_YN , N.EDIT_DATE , N.EDIT_ADMIN_NO , N.DELETE_YN FROM NOTICE N JOIN ADMIN A ON N.ADMIN_NO = A.NO ORDER BY N.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		
		PreparedStatement pstmt = null;
		List<AdminNoticeVo> list = new ArrayList<AdminNoticeVo>();
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() -1;
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminNoticeVo>();
			
			while(rs.next()) {
				
				AdminNoticeVo vo = new AdminNoticeVo();
				
				String no = rs.getString("NO");
				String name = rs.getString("NAME");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT"); 
				String thumbnailPath = rs.getString("THUMBNAIL_PATH");
				String thumbnailName = rs.getString("THUMBNAIL_NAME"); 
				String writeDate = rs.getString("WRITE_DATE"); 
				String importantYn = rs.getString("IMPORTANT_YN"); 
				String eidtDate = rs.getString("EDIT_DATE"); 
				String editAdminNo = rs.getString("EDIT_ADMIN_NO"); 
				String deleteYn = rs.getString("DELETE_YN"); 
				
				vo.setNo(no);
				vo.setName(name);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setThumbnailPath(thumbnailPath);
				vo.setThumbnailName(thumbnailName);
				vo.setWriteDate(writeDate);
				vo.setImportantYn(importantYn);
				vo.setEditDate(eidtDate);
				vo.setEditAdminNo(editAdminNo);
				vo.setDeleteYn(deleteYn);
				
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
}
