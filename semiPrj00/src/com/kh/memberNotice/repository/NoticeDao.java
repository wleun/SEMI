package com.kh.memberNotice.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;

import static com.kh.common.JDBCTemplate.*;

public class NoticeDao {

	public ArrayList<AdminNoticeVo> selectList(Connection conn) {
		String sql = "SELECT N.NO , A.NAME , N.TITLE , N.CONTENT , N.THUMBNAIL_PATH , N.THUMBNAIL_NAME , N.WRITE_DATE , N.IMPORTANT_YN , N.EDIT_DATE , N.EDIT_ADMIN_NO , N.DELETE_YN FROM NOTICE N JOIN ADMIN A ON N.ADMIN_NO = A.NO WHERE N.DELETE_YN = 'N'  ORDER BY N.NO DESC ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminNoticeVo> list = new ArrayList<AdminNoticeVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else {
					importantYn = "중요*";
				}
				
				AdminNoticeVo vo = new AdminNoticeVo();
				vo.setNo(no);
				vo.setAdminName(name);
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

	/*
	 * 상세조회
	 */
	public AdminNoticeVo selectOne(Connection conn, String num) {
		
		String sql = "SELECT * FROM NOTICE WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminNoticeVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			System.out.println("오류출력문1");
			rs = pstmt.executeQuery();
			System.out.println("오류출력문2");
			if(rs.next()) {
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writeDate = rs.getString("WRITE_DATE");
				String editDate = rs.getString("EDIT_DATE");
				String importantYn = rs.getString("IMPORTANT_YN");
				String editAdminNo = rs.getString("EDIT_ADMIN_NO");
				String deleteYn = rs.getString("DELETE_YN");
				
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else {
					importantYn = "중요*";
				}
				
				if("N".equals(deleteYn)) {
					deleteYn = "일반";
				} else {
					deleteYn = "삭제됨";
				}
				
				
				vo.setNo(num);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriteDate(writeDate);
				vo.setEditDate(editDate);
				vo.setEditAdminNo(editAdminNo);
				vo.setImportantYn(importantYn);
				vo.setDeleteYn(deleteYn);
		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
			return vo;
	}
	/*
	 * 공지상세 첨부파일
	 */
	public AdminNoticeAttachmentVo selectFile(Connection conn, String num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminNoticeAttachmentVo attachVo = new AdminNoticeAttachmentVo();
		
		String sql = "SELECT * FROM NOTICE_FILE WHERE NOTICE_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				String path = rs.getString("PATH");
				String name = rs.getString("NAME");
				
				attachVo.setPath(path);
				attachVo.setName(name);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return attachVo;
		
		}
	/*
	 * 총 페이지 수
	 */
	public int getCount(Connection conn) {
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
	 * 페이징
	 */
	public List<AdminNoticeVo> selectList(Connection conn, PageVo pageVo) {
		
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT N.NO , A.NAME , N.TITLE , N.CONTENT , N.THUMBNAIL_PATH , N.THUMBNAIL_NAME , N.WRITE_DATE , N.IMPORTANT_YN , N.EDIT_DATE , N.EDIT_ADMIN_NO , N.DELETE_YN FROM NOTICE N JOIN ADMIN A ON N.ADMIN_NO = A.NO WHERE N.DELETE_YN = 'N'  ORDER BY N.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		
		PreparedStatement pstmt = null;
		List<AdminNoticeVo> list = new ArrayList<AdminNoticeVo>();
		ResultSet rs = null;
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
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
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else {
					importantYn = "중요*";
				}
				
				AdminNoticeVo vo = new AdminNoticeVo();
				vo.setNo(no);
				vo.setAdminName(name);
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
			close(rs);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	
	
	
	}














