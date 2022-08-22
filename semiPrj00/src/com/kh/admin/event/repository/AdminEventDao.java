package com.kh.admin.event.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.common.vo.PageVo;

public class AdminEventDao {

	public int getCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM EVENT WHERE STATUS = 'B' OR STATUS= 'I' OR STATUS = 'E'";
		
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

	public List<AdminEventVo> selectList(Connection conn, PageVo pageVo) {
		
		List<AdminEventVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT E.NO , A.NAME , E.TITLE , E.CONTENT , E.THUMBNAIL_PATH , E.THUMBNAIL_NAME , E.WRITE_DATE , E.START_DATE , E.END_DATE , E.IMPORTANT_YN , E.EDIT_DATE , E.EDIT_ADMIN_NO , E.STATUS FROM EVENT E JOIN ADMIN A ON E.ADMIN_NO = A.NO WHERE E.STATUS = 'B' OR E.STATUS = 'I' OR E.STATUS = 'E' ORDER BY E.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminEventVo>();
			
			while(rs.next()) {
				
				AdminEventVo vo = new AdminEventVo();
				
				String no = rs.getString("NO");
				String name = rs.getString("NAME");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT"); 
				String thumbnailPath = rs.getString("THUMBNAIL_PATH");
				String thumbnailName = rs.getString("THUMBNAIL_NAME"); 
				String writeDate = rs.getString("WRITE_DATE"); 
				String startDate = rs.getString("START_DATE"); 
				String endDate = rs.getString("END_DATE"); 
				String importantYn = rs.getString("IMPORTANT_YN"); 
				String eidtDate = rs.getString("EDIT_DATE"); 
				String editAdminNo = rs.getString("EDIT_ADMIN_NO"); 
				String status = rs.getString("STATUS"); 
				
				if("B".equals(status)) {
					status = "진행예정";
				} else if ("I".equals(status)) {
					status = "진행중";
				} else {
					status = "종료됨";
				}
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else if ("Y".equals(importantYn)) {
					importantYn = "중요*";
				}
				
				vo.setNo(no);
				vo.setAdminName(name);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setThumbnailPath(thumbnailPath);
				vo.setThumbnailName(thumbnailName);
				vo.setWriteDate(writeDate);
				vo.setStartDate(startDate);
				vo.setEndDate(endDate);
				vo.setImportantYN(importantYn);
				vo.setEditDate(eidtDate);
				vo.setEditAdminNo(editAdminNo);
				vo.setStatus(status);
				
				
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
	
	//게시글 작성 (이벤트 테이블만 채워줌)

	public static int insertEvent(Connection conn, AdminEventVo adminEventVo) {
		
		String sql = "INSERT INTO EVENT (NO, ADMIN_NO, TITLE, CONTENT, THUMBNAIL_PATH, THUMBNAIL_NAME, START_DATE, END_DATE) VALUES (SEQ_EVENT_NO.NEXTVAL , ? , ? , ? , ? , ? , ? , ? )";
		int result =0;
		PreparedStatement pstmt = null;
		
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, adminEventVo.getAdminName());
			pstmt.setString(2, adminEventVo.getTitle());
			pstmt.setString(3, adminEventVo.getContent());
			pstmt.setString(4, adminEventVo.getThumbnailPath());
			pstmt.setString(5, adminEventVo.getThumbnailName());
			pstmt.setString(6, adminEventVo.getStartDate());
			pstmt.setString(7, adminEventVo.getEndDate());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//게시글 작성 (이벤트_파일 테이블만 채워줌)
	
	public static int insertAttachment(Connection conn, AdminEventAttachmentVo adminEventAttachmentVo) {
		String sql = "INSERT INTO EVENT_FILE (NO, EVENT_NO, PATH, NAME) VALUES (SEQ_EVENT_FILE_NO.NEXTVAL, SEQ_EVENT_NO.CURRVAL, ?, ?)";
		int result =0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, adminEventAttachmentVo.getPath());
			pstmt.setString(2, adminEventAttachmentVo.getName());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
