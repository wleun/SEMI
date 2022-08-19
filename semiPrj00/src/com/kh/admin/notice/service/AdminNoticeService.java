package com.kh.admin.notice.service;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.notice.repository.AdminNoticeDao;
import com.kh.admin.notice.vo.AdminNoticeVo;
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
}
