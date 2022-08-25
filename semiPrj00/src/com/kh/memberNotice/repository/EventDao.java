package com.kh.memberNotice.repository;

import static com.kh.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;

public class EventDao {
	/*
	 * 총 이벤트 게시글 갯수
	 */
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
	/*
	 * 페이징
	 */
	public List<AdminEventVo> selectList(Connection conn, PageVo pageVo) {

		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM (SELECT * FROM  DONATE_LIST d LEFT OUTER JOIN (SELECT p.NAME P_TITLE, r.NO REARD_NO FROM REWARD r LEFT OUTER JOIN PROJECT p ON r.PROJECT_NO = p.PROJECT_NO) j ON d.REWARD_NO = REWARD_NO WHERE d.MEMBER_NO=?) T ) WHERE RNUM BETWEEN ? AND ?";

		List<AdminEventVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			int start = (pageVo.getCurrentPage()-1)*pageVo.getBoardLimit() + 1;
			int end = start + pageVo.getBoardLimit() - 1;
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminEventVo>();
			
			while(rs.next()) {
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
				} else if ("E".equals(status)) {
					status = "종료됨";
				} else {
					status = "삭제됨";
				}
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else if ("Y".equals(importantYn)) {
					importantYn = "중요*";
				}
				
				AdminEventVo vo = new AdminEventVo();
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
	/*
	 * 이벤트 상세조회
	 */
	public AdminEventVo selectOne(Connection conn, String num) {
		String sql = "SELECT TITLE , CONTENT , WRITE_DATE , START_DATE , END_DATE , IMPORTANT_YN , EDIT_DATE , EDIT_ADMIN_NO , STATUS , THUMBNAIL_PATH, THUMBNAIL_NAME FROM EVENT WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminEventVo eventVo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String writeDate = rs.getString("WRITE_DATE");
				String startDate = rs.getString("START_DATE");
				String endDate = rs.getString("END_DATE");
				String editDate = rs.getString("EDIT_DATE");
				String importantYn = rs.getString("IMPORTANT_YN");
				String editAdminNo = rs.getString("EDIT_ADMIN_NO");
				String status = rs.getString("STATUS");
				String thumbnailPath = rs.getString("THUMBNAIL_PATH");
				String thumbnailName = rs.getString("THUMBNAIL_NAME");

				if("N".equals(importantYn)) {
					importantYn = "-";
				} else if ("Y".equals(importantYn)) {
					importantYn = "중요*";
				} 
				
				if("B".equals(status)) {
					status = "진행예정";
				} else if("I".equals(status)) {
					status = "진행중";
				} else if("E".equals(status)) {
					status = "종료";
				} else {
					status = "삭제됨";
				}
				
				eventVo = new AdminEventVo();
				
				eventVo.setNo(num);
				eventVo.setTitle(title);
				eventVo.setContent(content);
				eventVo.setWriteDate(writeDate);
				eventVo.setStartDate(startDate);
				eventVo.setEndDate(endDate);
				eventVo.setEditDate(editDate);
				eventVo.setImportantYN(importantYn);
				eventVo.setEditAdminNo(editAdminNo);
				eventVo.setStatus(status);
				eventVo.setThumbnailPath(thumbnailPath);
				eventVo.setThumbnailName(thumbnailName);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return eventVo;
	}
	/*
	 * 첨부파일 조회
	 */
	public AdminEventAttachmentVo selectFile(Connection conn, String num) {
		String sql = "SELECT PATH, NAME FROM EVENT_FILE WHERE EVENT_NO = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminEventAttachmentVo attachVo = new AdminEventAttachmentVo();
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

}
