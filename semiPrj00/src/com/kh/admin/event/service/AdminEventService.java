package com.kh.admin.event.service;

import java.sql.Connection;
import java.util.List;

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

}
