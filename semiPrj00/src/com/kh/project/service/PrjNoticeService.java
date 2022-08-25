package com.kh.project.service;

import java.sql.Connection;

import com.kh.project.notice.vo.ProjectNoticeVo;
import com.kh.project.repository.PrjNoticeDao;

import static com.kh.common.JDBCTemplate.*;

public class PrjNoticeService {

	PrjNoticeDao dao = new PrjNoticeDao();
	
	public int insertNotice(ProjectNoticeVo nvo) {

		Connection conn = getConnection();
		int result = 0;
		
		if(nvo.getContent() != null) {
			result = dao.insertNotice(conn, nvo);
		}else {
			result = -1;
		}
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
