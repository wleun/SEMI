package com.kh.admin.main.service;

import java.sql.Connection;

import com.kh.admin.event.repository.AdminEventDao;
import com.kh.admin.main.vo.AdminMainCountVo;
import com.kh.admin.notice.repository.AdminNoticeDao;
import com.kh.admin.project.repository.AdminPrjDao;
import com.kh.admin.proposal.repository.AdminProposalDao;
import com.kh.admin.report.repository.AdminReportDao;

import static com.kh.common.JDBCTemplate.*;

public class AdminMainService {

	public AdminMainCountVo getCounts() {
		
		Connection conn = getConnection();
		String reportCnt = new AdminReportDao().getReportCnt(conn);
		String eventCnt = new AdminEventDao().getEventCnt(conn);
		String noticeCnt = new AdminNoticeDao().getNoticeCnt(conn);
		String proposalCnt = new AdminProposalDao().getProposalCnt(conn);
		String beforePrjcnt = new AdminPrjDao().getBeforePrjCnt(conn);
		String prjCnt = new AdminPrjDao().getPrjCnt(conn);
		
		AdminMainCountVo cntVo = new AdminMainCountVo();
		cntVo.setReportCnt(reportCnt);
		cntVo.setEventCnt(eventCnt);
		cntVo.setNoticeCnt(noticeCnt);
		cntVo.setProposalCnt(proposalCnt);
		cntVo.setBeforePrjCnt(beforePrjcnt);
		cntVo.setPrjCnt(prjCnt);
		
		close(conn);
		
		return cntVo;
		
	}
	
	

}
