package com.kh.project.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.project.report.vo.ProjectReportVo;
import com.kh.project.repository.PrjReportDao;

public class PrjReportService {

	
	//프로젝트 신고 insert
	public int insertReport(ProjectReportVo reportVo) {
		Connection conn = getConnection();
		int result = 0;

		//신고 내용이 없으면 insert 불가
		if(reportVo.getContent() == null || reportVo.getContent().isEmpty()) {
			return -1;
		}

		//dao 호출
		try {
			result = new PrjReportDao().insertReport(conn, reportVo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		
		return result;
		
	}

}
