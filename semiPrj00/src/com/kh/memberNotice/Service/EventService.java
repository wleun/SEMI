package com.kh.memberNotice.Service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.attachment.vo.AdminEventAttachmentVo;
import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.event.vo.AdminEventVo;
import com.kh.common.vo.PageVo;
import com.kh.memberNotice.repository.EventDao;

public class EventService {
	/*
	 * 총 게시글 갯수
	 */
	public int getCount() {
		Connection conn = getConnection();
		int result = new EventDao().getCount(conn);
		
		close(conn);
		
		return result;
	}
	/*
	 * 이벤트 페이징
	 */
	public List<AdminEventVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		
		List<AdminEventVo> EventVoList = new EventDao().selectList(conn,pageVo);
		close(conn);
		
		return EventVoList;
	}
	/*
	 * 이벤트 상세조회
	 */
	public AdminEventVo selectOne(String num) {
		Connection conn = getConnection();
		AdminEventVo EventVo = new EventDao().selectOne(conn,num);
		
		close(conn);
		
		return EventVo;
		
	}
	/*
	 * 첨부파일 조회
	 */
	public AdminEventAttachmentVo selectFile(String num) {
		Connection conn = getConnection();
		AdminEventAttachmentVo attachVo = new EventDao().selectFile(conn,num);
		
		close(conn);
		
		return attachVo;
	}

}
