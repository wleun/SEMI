package com.kh.admin.event.service;

import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.common.vo.PageVo;
import static com.kh.common.JDBCTemplate.*;


public class AdminEventService {

	public int getCount() {
		
		Connection conn = getConnection();
		int result = new AdminEventDao().getCount(conn);
		
		close(conn);
		
		return result;
		
	}

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
		}
		
		if(adminEventVo.getContent().length() <1) {
			//내용 글자수 1자 미만(0개)
			return -2;
		}
		
		if(adminEventVo.getStartDate().length()<1) {
			return -3;
		}
		
		if(adminEventVo.getEndDate().length()<1) {
			return -4;
		}
		
//		String startDate = adminEventVo.getStartDate();
//		String endDate = adminEventVo.getEndDate();
//		
//		//날짜 계산 (endDate가 startDate보다 미래인지)
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		try {
//			Date date1 = (Date) transFormat.parse(startDate);
//			Date date2 = (Date) transFormat.parse(endDate);
//			
//			if(date1.compareTo(date2)>0) {
//				//startDate가 endDate보다 미래이다.
//				return -5;
//			}
//			
//			if(date1.compareTo(date2)==0) {
//				//startDate = endDate이다.
//				return -6;
//			}
//		} catch (ParseException e) {e.printStackTrace();}
//		
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
				return -7;
			} else if (result2 == 1) {
				//이미지 첨부되었으나, 섬네일 X
				rollback(conn);
				return -8;
			} else {
				//둘 다 실패 혹은 기타
				rollback(conn);
				return -9;
			}
		}
		
		close(conn);
		
		return result1 * result2;
		
		
	}

}
