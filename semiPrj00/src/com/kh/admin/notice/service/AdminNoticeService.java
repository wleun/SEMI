package com.kh.admin.notice.service;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.admin.notice.repository.AdminNoticeDao;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.admin.project.repository.AdminPrjDao;
import com.kh.common.vo.PageVo;
import static com.kh.common.JDBCTemplate.*;

public class AdminNoticeService {


	public int getCount() {
		
		Connection conn = getConnection();
		int result = new AdminNoticeDao().getCount(conn);
		
		close(conn);
		return result;
	}

	public List<AdminNoticeVo> selectList(PageVo pageVo) {
		
		Connection conn = getConnection();
		List<AdminNoticeVo> adminNoticeVoList = new AdminNoticeDao().selectList(conn,pageVo);
		
		close(conn);
		return adminNoticeVoList;
	}
	

	public int deleteNotice(List<String> noticeNoList) {
		int successCnt = 0;
		int result = 0;
		Connection conn = getConnection();
		
		try {
			for (String noticeNo : noticeNoList) {
				
				result = new AdminNoticeDao().deleteNotice(conn,noticeNo);
				
				if(result==1) {successCnt = successCnt + 1;}
				else {System.out.println("프로젝트 번호" + noticeNo + "번 삭제 중 오류 발생");}
			}
			
			if(result==1) {commit(conn);}
			else {rollback(conn);}
			
		} catch(Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		System.out.println(successCnt);
		
		return successCnt;
	}

	public int insertNotice(AdminNoticeVo adminNoticeVo, AdminNoticeAttachmentVo adminNoticeAttachmentVo) {
		
		if(adminNoticeVo.getTitle().length()<1) {
			return -1;
		} else if (adminNoticeVo.getContent().length()<1) {
			return -2;
		} 
		
		Connection conn = getConnection();
		
		int result1 = AdminNoticeDao.insertNotice(conn, adminNoticeVo);
		int result2 = AdminNoticeDao.insertNotice(conn, adminNoticeAttachmentVo);

		if (result1*result2 ==1) {
			commit(conn);
		} else {
			if(result1==1) {
				rollback(conn);
				return -3;
			} else if (result2==1) {
				rollback(conn);
				return -4;
			} else {
				rollback(conn);
				return -5;
			}
	
		}

		close(conn);
		
		return result1 * result2;
		
		
	}
	
	public AdminNoticeVo selectOne(String no) {
		Connection conn = getConnection();
		AdminNoticeVo adminNoticeVo = new AdminNoticeDao().selectOne(conn,no);
		
		close(conn);
		
		return adminNoticeVo;
		
	}

	public AdminNoticeAttachmentVo selectFile(String no) {
		Connection conn = getConnection();
		AdminNoticeAttachmentVo adminNoticeAttachmentVo = new AdminNoticeDao().selectFile(conn,no);
		
		close(conn);
		
		return adminNoticeAttachmentVo;
	}

	public int deleteNotice(String no) {
		Connection conn = getConnection();
		int result = new AdminNoticeDao().deleteNotice(conn, no);
		
		close(conn);
		
		return result;
	}


}
