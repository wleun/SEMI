package com.kh.memberNotice.Service;

import java.sql.Connection;

import com.kh.admin.notice.vo.AdminNoticeVo;
import com.kh.common.vo.PageVo;
import com.kh.memberNotice.repository.NoticeDao;

import java.util.*;

import static com.kh.common.JDBCTemplate.*;

public class NoticeService {
	private final NoticeDao dao = new NoticeDao();
	
	//listCount값 구하기 현재 총 게시글 갯수
	public int getCount() {
	
		
		int result = 0;
		Connection conn = null;
		
		try {
			conn = getConnection();
			result = dao.getCount(conn);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	/*
	 * 게시글 리스트 조회
	 */

	public List<AdminNoticeVo> selectList(PageVo pageVo) {
		
		Connection conn = null;
		List<AdminNoticeVo> voList = null;
		
		conn= getConnection();
		//dao호출
		voList = dao.selectList(conn,pageVo);
		
		close(conn);
		
		return voList;
	}
	

}
