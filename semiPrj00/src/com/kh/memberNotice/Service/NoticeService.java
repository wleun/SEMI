package com.kh.memberNotice.Service;

import java.sql.Connection;

import com.kh.admin.attachment.vo.AdminNoticeAttachmentVo;
import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;
import com.kh.memberNotice.repository.NoticeDao;

import java.util.*;

import static com.kh.common.JDBCTemplate.*;

public class NoticeService {
	
	public ArrayList<AdminNoticeVo> selectList(){
		/*
		 * 공지사항리스트
		 */
		Connection conn = null;
		ArrayList<AdminNoticeVo> voList = null;
	
		try {
			conn = getConnection();
			voList = new NoticeDao().selectList(conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return voList;
	
	}
	/*
	 * 공지사항 상세조회
	 */
	public AdminNoticeVo selectOne(String num) {
		Connection conn = null;
		AdminNoticeVo vo = null;
		
		try {
			conn = getConnection();
			vo = new NoticeDao().selectOne(conn,num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return vo;
	}
	/*
	 * 공지사항 첨부파일
	 */
	public AdminNoticeAttachmentVo selectFile(String num) {
		Connection conn = null;
		AdminNoticeAttachmentVo attachVo = null;
		
		try {
			conn= getConnection();
			attachVo = new NoticeDao().selectFile(conn,num);
;		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);		
		}
		return attachVo;
	}
	/*
	 * 페이징>총 게시글 수
	 */
	public int getCount() {
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			result = new NoticeDao().getCount(conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	/*
	 * 페이징
	 */
	public List<AdminNoticeVo> selectList(PageVo pageVo) {
		
		Connection conn = null;
		List<AdminNoticeVo> voList = null;
		
		conn = getConnection();
		voList = new NoticeDao().selectList(conn,pageVo);
		
		close(conn);
		
		return voList;
	}
	
}








