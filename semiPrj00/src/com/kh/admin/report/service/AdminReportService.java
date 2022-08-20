package com.kh.admin.report.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.admin.proposal.repository.AdminProposalDao;
import com.kh.admin.proposal.vo.AdminProposalVo;
import com.kh.admin.report.repository.AdminReportDao;
import com.kh.admin.report.vo.AdminReportVo;
import com.kh.common.vo.PageVo;

public class AdminReportService {

	public int getCount() {
		Connection conn = getConnection();
		int result = new AdminReportDao().getCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<AdminReportVo> selectList(PageVo pageVo) {
		Connection conn = getConnection();
		List<AdminReportVo> adminReportVoList = new AdminReportDao().selectList(conn,pageVo);
		
		close(conn);
		return adminReportVoList;
	}

}
