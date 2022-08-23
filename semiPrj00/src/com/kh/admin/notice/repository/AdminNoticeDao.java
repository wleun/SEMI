package com.kh.admin.notice.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;

public class AdminNoticeDao {

	//공지사항 페이징을 위한 카운트
	public int getCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM NOTICE WHERE DELETE_YN = 'N'";
		
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
	
	//공지사항 페이징
	
	public List<AdminNoticeVo> selectList(Connection conn, PageVo pageVo) {
		
		List<AdminNoticeVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT N.NO , A.NAME , N.TITLE , N.CONTENT , N.THUMBNAIL_PATH , N.THUMBNAIL_NAME , N.WRITE_DATE , N.IMPORTANT_YN , N.EDIT_DATE , N.EDIT_ADMIN_NO , N.DELETE_YN FROM NOTICE N JOIN ADMIN A ON N.ADMIN_NO = A.NO WHERE N.DELETE_YN = 'N'  ORDER BY N.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else {
					importantYn = "중요*";
				}
				
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
	
	//공지사항 삭제

	public int deleteNotice(Connection conn, String noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE NOTICE SET DELETE_YN = 'Y' WHERE NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, noticeNo);
			
			result = pstmt.executeUpdate();
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
			return result;
		}
	
	//공지사항 작성

	public static int insertNotice(Connection conn, AdminNoticeVo adminNoticeVo) {
		
		String sql = " INSERT INTO NOTICE ( NO, ADMIN_NO, TITLE, CONTENT, THUMBNAIL_PATH, THUMBNAIL_NAME, IMPORTANT_YN ) VALUES ( SEQ_NOTICE_NO.NEXTVAL , ? , ? , ? , ? , ? , ? )";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminNoticeVo.getAdminName());
			pstmt.setString(2, adminNoticeVo.getTitle());
			pstmt.setString(3, adminNoticeVo.getContent());
			pstmt.setString(4, adminNoticeVo.getThumbnailPath());
			pstmt.setString(5, adminNoticeVo.getThumbnailName());
			pstmt.setString(6, adminNoticeVo.getImportantYn());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//공지사항 작성

	public static int insertNotice(Connection conn, AdminNoticeAttachmentVo adminNoticeAttachmentVo) {
		
		String sql = "INSERT INTO NOTICE_FILE ( NO, NOTICE_NO, PATH, NAME ) VALUES ( SEQ_NOTICE_FILE_NO.NEXTVAL, SEQ_NOTICE_NO.CURRVAL, ? , ? )";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminNoticeAttachmentVo.getPath());
			pstmt.setString(2, adminNoticeAttachmentVo.getName());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	// 상세조회 (adminNoticeVo 리턴)
	
	public AdminNoticeVo selectOne(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminNoticeVo adminNoticeVo = new AdminNoticeVo();
		
		String sql = "SELECT * FROM NOTICE WHERE NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
			rs=pstmt.executeQuery();
			
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
				
				
				adminNoticeVo.setNo(no);
				adminNoticeVo.setTitle(title);
				adminNoticeVo.setContent(content);
				adminNoticeVo.setWriteDate(writeDate);
				adminNoticeVo.setEditDate(editDate);
				adminNoticeVo.setEditAdminNo(editAdminNo);
				adminNoticeVo.setImportantYn(importantYn);
				adminNoticeVo.setDeleteYn(deleteYn);
				
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return adminNoticeVo;
	}

	//상세조회 (파일)
	
	public AdminNoticeAttachmentVo selectFile(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminNoticeAttachmentVo adminNoticeAttachmentVo = new AdminNoticeAttachmentVo();
		
		String sql = "SELECT * FROM NOTICE_FILE WHERE NOTICE_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				String path = rs.getString("PATH");
				String name = rs.getString("NAME");
				
				adminNoticeAttachmentVo.setPath(path);
				adminNoticeAttachmentVo.setName(name);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return adminNoticeAttachmentVo;
		
	}
	
	//공지사항 수정

	public static int EditNotice(Connection conn, AdminNoticeVo adminNoticeVo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICE SET TITLE = ? , CONTENT = ? , THUMBNAIL_PATH = ? , THUMBNAIL_NAME = ? , IMPORTANT_YN = ? , EDIT_DATE = SYSDATE , EDIT_ADMIN_NO = ? WHERE NO = ?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, adminNoticeVo.getTitle());
			pstmt.setString(2, adminNoticeVo.getContent());
			pstmt.setString(3, adminNoticeVo.getThumbnailPath());
			pstmt.setString(4, adminNoticeVo.getThumbnailName());
			pstmt.setString(5, adminNoticeVo.getImportantYn());
			pstmt.setString(6, adminNoticeVo.getAdminName());
			pstmt.setString(7, adminNoticeVo.getNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("공지사항 수정 현황 : " + result );
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	

	//공지사항 수정 (파일)
	
	public static int EditFile(Connection conn, AdminNoticeAttachmentVo adminNoticeAttachmentVo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICE_FILE SET PATH = ? , NAME = ? WHERE NOTICE_NO = ?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, adminNoticeAttachmentVo.getPath());
			pstmt.setString(2, adminNoticeAttachmentVo.getName());
			pstmt.setString(3, adminNoticeAttachmentVo.getNoticeNo());
			
			result=pstmt.executeUpdate();
			
			System.out.println("이벤트 파일 수정 현황 : " +  result );
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
		
}

