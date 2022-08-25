package com.kh.admin.event.service;

import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.notice.repository.AdminNoticeDao;
import com.kh.common.vo.PageVo;
import static com.kh.common.JDBCTemplate.*;


public class AdminEventService {

	//페이징 카운트
	
	public int getCount() {
		
		Connection conn = getConnection();
		int result = new AdminEventDao().getCount(conn);
		
		close(conn);
		
		return result;
		
	}
	
	//페이징 셀렉트 

	public List<AdminEventVo> selectList(PageVo pageVo) {
		
		Connection conn = getConnection();
		List<AdminEventVo> adminEventVoList = new AdminEventDao().selectList(conn,pageVo);
		
		close(conn);
		return adminEventVoList;
	}

	public int insertEvent(AdminEventVo adminEventVo, AdminEventAttachmentVo adminEventAttachmentVo) {
		
		//데이터 검사
		
		if(adminEventVo.getTitle().length() <1) {
			//제목 글자수 1자 미만(0개)
			return -1;
		} else if(adminEventVo.getContent().length() <1) {
			//내용 글자수 1자 미만(0개)
			return -2;
		} else if (adminEventVo.getStartDate().length()<1) {
			return -3;
		} else if (adminEventVo.getEndDate().length()<1) {
			return -4;
		}
		
		Connection conn = getConnection();
		
		int result1 = AdminEventDao.insertEvent(conn,adminEventVo);
		int result2 = AdminEventDao.insertAttachment(conn,adminEventAttachmentVo);
		
		//트랜잭션 처리
		
		if(result1*result2 ==1) {
			commit(conn);
		} else {
			if(result1 == 1) {
				//섬네일은 첨부되었으나, 이미지 파일 X
				rollback(conn);
				close(conn);
				return -7;
			} else if (result2 == 1) {
				//이미지 첨부되었으나, 섬네일 X
				rollback(conn);
				close(conn);
				return -8;
			} else {
				//둘 다 실패 혹은 기타
				rollback(conn);
				close(conn);
				return -9;
			}
		}
		
		close(conn);
		
		return result1 * result2;
		
		
	}
	
	// 상세조회 SELECT

	public AdminEventVo selectOne(String no) {
		
		Connection conn = getConnection();
		AdminEventVo adminEventVo = new AdminEventDao().selectOne(conn,no);
		
		close(conn);
		
		return adminEventVo;
	}
	
	// 상세조회 (파일) SELECT

	public AdminEventAttachmentVo selectFile(String no) {
		
		Connection conn = getConnection();
		AdminEventAttachmentVo adminEventAttachmentVo = new AdminEventDao().selectFile(conn,no);
		
		close(conn);
		
		return adminEventAttachmentVo;
	}
	
	// 이벤트 삭제 (UPDATE)

	public int deleteEvent(String no) {
		Connection conn = getConnection();
		int result = 0;
				
		try {
			result = new AdminEventDao().deleteEvent(conn, no);
			
			if(result==1) {
				commit(conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
			rollback(conn);
		} finally {
			rollback(conn);
			close(conn);
		}
		
		return result;
	}
	
	//이벤트 수정 (UPDATE)

	public int editEvent(AdminEventVo adminEventVo, AdminEventAttachmentVo adminEventAttachmentVo) {
		
		if(adminEventVo.getTitle().length() <1) {
			//제목 글자수 1자 미만(0개)
			return -1;
		} else if(adminEventVo.getContent().length() <1) {
			//내용 글자수 1자 미만(0개)
			return -2;
		} else if (adminEventVo.getStartDate().length()<1) {
			return -3;
		} else if (adminEventVo.getEndDate().length()<1) {
			return -4;
		}
		
		Connection conn = getConnection();
		
		int result1 = AdminEventDao.EditEvent(conn,adminEventVo);
		int result2 = AdminEventDao.EditFile(conn,adminEventAttachmentVo);
		
		//트랜잭션 처리
		
		System.out.println("결과값(서비스) : " + result1 * result2);
		
		if(result1*result2 ==1) {
			commit(conn);
		} else {
			if(result1 == 1) {
				//섬네일은 첨부되었으나, 이미지 파일 X
				rollback(conn);
				close(conn);
				return -7;
			} else if (result2 == 1) {
				//이미지 첨부되었으나, 섬네일 X
				rollback(conn);
				close(conn);
				return -8;
			} else {
				//둘 다 실패 혹은 기타
				rollback(conn);
				close(conn);
				return -9;
			}
		}
		
		close(conn);
		
		return result1 * result2;
	}

	//대시보드 - 메인 페이지 정보 가져오기
	public List<AdminEventVo> getMainData() {
		Connection conn = getConnection();
		
		List<AdminEventVo> eventVoList = new AdminEventDao().getMainData(conn);
		
		close(conn);
		
		return eventVoList;
	}

}
