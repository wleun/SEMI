package com.kh.admin.report.service;

import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.proposal.repository.AdminProposalDao;
import com.kh.admin.proposal.vo.AdminProposalVo;
import com.kh.admin.report.repository.AdminReportDao;
import com.kh.admin.report.vo.AdminReportVo;
import com.kh.common.vo.PageVo;

public class AdminReportService {

	//페이징 관련 카운트
	
	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminReportDao().getCount(conn);
		
		close(conn);
		
		return result;
	}
	
	
	// 페이징 리스트 

	public List<AdminReportVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		List<AdminReportVo> adminReportVoList = new AdminReportDao().selectList(conn,pageVo);
		
		close(conn);
		return adminReportVoList;
	}

	// 신고 조치완료 (UPDATE)
	
	public int reportComplete(String no) {
		
		Connection conn = getConnection();
		int result = 0;
		try {
			result = new AdminReportDao().reportComplete(conn, no);
			
			if(result==1) {commit(conn);} 
			else {rollback(conn);}
		} catch (Exception e) {
			rollback(conn);
			e.printStackTrace();
		} finally {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
