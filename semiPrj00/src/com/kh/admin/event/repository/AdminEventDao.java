package com.kh.admin.event.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.project.vo.AdminPrjVo;
import com.kh.common.vo.PageVo;

public class AdminEventDao {

	//페이징 관련 카운트 
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

	//페이징 리스트
	public List<AdminEventVo> selectList(Connection conn, PageVo pageVo) {
		
		List<AdminEventVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT E.NO , A.NAME , E.TITLE , E.CONTENT , E.THUMBNAIL_PATH , E.THUMBNAIL_NAME , E.WRITE_DATE , TO_CHAR(E.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(E.END_DATE,'YYYY-MM-DD') AS END_DATE , E.IMPORTANT_YN , E.EDIT_DATE , E.EDIT_ADMIN_NO , E.STATUS FROM EVENT E JOIN ADMIN A ON E.ADMIN_NO = A.NO WHERE E.STATUS = 'B' OR E.STATUS = 'I' OR E.STATUS = 'E' ORDER BY E.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
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
		
		String sql = "INSERT INTO EVENT (NO, ADMIN_NO, TITLE, CONTENT, THUMBNAIL_PATH, THUMBNAIL_NAME, START_DATE, END_DATE, IMPORTANT_YN ) VALUES (SEQ_EVENT_NO.NEXTVAL , ? , ? , ? , ? , ? , ? , ?, ? )";
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
			pstmt.setString(8, adminEventVo.getImportantYN());
			
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
	
	// 상세조회 (adminEventVo 리턴)

	public AdminEventVo selectOne(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminEventVo adminEventVo = new AdminEventVo();
		
		String sql = "SELECT TITLE , CONTENT , WRITE_DATE , TO_CHAR(START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(END_DATE,'YYYY-MM-DD') AS END_DATE , IMPORTANT_YN , EDIT_DATE , EDIT_ADMIN_NO , STATUS , THUMBNAIL_PATH, THUMBNAIL_NAME FROM EVENT WHERE NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
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
				
				adminEventVo.setNo(no);
				adminEventVo.setTitle(title);
				adminEventVo.setContent(content);
				adminEventVo.setWriteDate(writeDate);
				adminEventVo.setStartDate(startDate);
				adminEventVo.setEndDate(endDate);
				adminEventVo.setEditDate(editDate);
				adminEventVo.setImportantYN(importantYn);
				adminEventVo.setEditAdminNo(editAdminNo);
				adminEventVo.setStatus(status);
				adminEventVo.setThumbnailPath(thumbnailPath);
				adminEventVo.setThumbnailName(thumbnailName);
				
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return adminEventVo;
	}

	// 상세조회 (adminEventAttachmentVo 리턴)
	
	public AdminEventAttachmentVo selectFile(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminEventAttachmentVo adminEventAttachmentVo = new AdminEventAttachmentVo();
		
		String sql = "SELECT PATH, NAME FROM EVENT_FILE WHERE EVENT_NO = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				String path = rs.getString("PATH");
				String name = rs.getString("NAME");
				
				adminEventAttachmentVo.setPath(path);
				adminEventAttachmentVo.setName(name);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return adminEventAttachmentVo;
		
		
	}
	
	//이벤트 상세조회 > 삭제

	public int deleteEvent(Connection conn, String no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE EVENT SET STATUS = 'D' WHERE NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		return result;
		
	}
	
	//이벤트 수정

	public static int EditEvent(Connection conn, AdminEventVo adminEventVo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE EVENT SET TITLE = ? , CONTENT = ? , THUMBNAIL_PATH = ? , THUMBNAIL_NAME = ? , START_DATE = ? , END_DATE = ? , IMPORTANT_YN = ? , EDIT_DATE = SYSDATE , EDIT_ADMIN_NO = ? WHERE NO = ?";
		
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, adminEventVo.getTitle());
			pstmt.setString(2, adminEventVo.getContent());
			pstmt.setString(3, adminEventVo.getThumbnailPath());
			pstmt.setString(4, adminEventVo.getThumbnailName());
			pstmt.setString(5, adminEventVo.getStartDate());
			pstmt.setString(6, adminEventVo.getEndDate());
			pstmt.setString(7, adminEventVo.getImportantYN());
			pstmt.setString(8, adminEventVo.getAdminName());
			pstmt.setString(9, adminEventVo.getNo());
			
			result=pstmt.executeUpdate();
			
			System.out.println("이벤트 수정 현황 : " +  result );
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//이벤트 수정 (파일)
	
	public static int EditFile(Connection conn, AdminEventAttachmentVo adminEventAttachmentVo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = "UPDATE EVENT_FILE SET PATH = ? , NAME = ? WHERE EVENT_NO = ?";
			
			try {
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, adminEventAttachmentVo.getPath());
				pstmt.setString(2, adminEventAttachmentVo.getName());
				pstmt.setString(3, adminEventAttachmentVo.getEventNo());
				
				result=pstmt.executeUpdate();
				
				System.out.println("이벤트 파일 수정 현황 : " +  result );
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}

	//대시보드 - 진행중 이벤트 카운트
	public String getEventCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = "";
		
		String sql = "SELECT COUNT(NO) AS COUNT FROM EVENT WHERE STATUS= 'I'";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getString("COUNT");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	
	}

	// 대시보드 - 이벤트 관련 정보 가져오기
	public List<AdminEventVo> getMainData(Connection conn) {
		List<AdminEventVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT E.NO , A.NAME , E.TITLE , E.CONTENT , E.THUMBNAIL_PATH , E.THUMBNAIL_NAME , E.WRITE_DATE , TO_CHAR(E.START_DATE,'YYYY-MM-DD') AS START_DATE , TO_CHAR(E.END_DATE,'YYYY-MM-DD') AS END_DATE , E.IMPORTANT_YN , E.EDIT_DATE , E.EDIT_ADMIN_NO , E.STATUS FROM EVENT E JOIN ADMIN A ON E.ADMIN_NO = A.NO WHERE E.STATUS = 'I' ORDER BY E.NO DESC ) T ) WHERE RNUM BETWEEN 1 AND 4";
		
		try {
			
			pstmt= conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminEventVo>();
			
			while(rs.next()) {
				
				AdminEventVo vo = new AdminEventVo();
				
				String no = rs.getString("NO");
				String title = rs.getString("TITLE");
				String thumbnailPath = rs.getString("THUMBNAIL_PATH");
				String thumbnailName = rs.getString("THUMBNAIL_NAME"); 
				String endDate = rs.getString("END_DATE"); 
				String importantYn = rs.getString("IMPORTANT_YN"); 
				String status = rs.getString("STATUS"); 
				
				if ("I".equals(status)) {
					status = "진행중";
				}
				
				if("N".equals(importantYn)) {
					importantYn = "-";
				} else if ("Y".equals(importantYn)) {
					importantYn = "중요*";
				}
				
				int nameLength = title.length();
				int subStringLength = 13;
				if(nameLength<subStringLength) {
					subStringLength = nameLength;
				}
				String subTitle = title.substring(0,subStringLength);
				
				vo.setNo(no);
				vo.setTitle(subTitle);
				vo.setThumbnailPath(thumbnailPath);
				vo.setThumbnailName(thumbnailName);
				vo.setEndDate(endDate);
				vo.setImportantYN(importantYn);
				
				
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

