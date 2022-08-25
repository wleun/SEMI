package com.kh.admin.main.vo;

public class AdminMainCountVo {
	
	public AdminMainCountVo() {
		
	}
	
	public AdminMainCountVo(String proposalCnt, String reportCnt, String eventCnt, String noticeCnt,
			String beforePrjCnt, String prjCnt) {
		super();
		this.proposalCnt = proposalCnt;
		this.reportCnt = reportCnt;
		this.eventCnt = eventCnt;
		this.noticeCnt = noticeCnt;
		this.beforePrjCnt = beforePrjCnt;
		this.prjCnt = prjCnt;
	}

	private String proposalCnt;
	private String reportCnt;
	private String eventCnt;
	private String noticeCnt;
	private String beforePrjCnt;
	private String prjCnt;
	public String getProposalCnt() {
		return proposalCnt;
	}

	public void setProposalCnt(String proposalCnt) {
		this.proposalCnt = proposalCnt;
	}

	public String getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(String reportCnt) {
		this.reportCnt = reportCnt;
	}

	public String getEventCnt() {
		return eventCnt;
	}

	public void setEventCnt(String eventCnt) {
		this.eventCnt = eventCnt;
	}

	public String getNoticeCnt() {
		return noticeCnt;
	}

	public void setNoticeCnt(String noticeCnt) {
		this.noticeCnt = noticeCnt;
	}

	public String getBeforePrjCnt() {
		return beforePrjCnt;
	}

	public void setBeforePrjCnt(String beforePrjCnt) {
		this.beforePrjCnt = beforePrjCnt;
	}

	public String getPrjCnt() {
		return prjCnt;
	}

	public void setPrjCnt(String prjCnt) {
		this.prjCnt = prjCnt;
	}

	@Override
	public String toString() {
		return "AdminMainCountVo [proposalCnt=" + proposalCnt + ", reportCnt=" + reportCnt + ", eventCnt=" + eventCnt
				+ ", noticeCnt=" + noticeCnt + ", beforePrjCnt=" + beforePrjCnt + ", prjCnt=" + prjCnt + "]";
	}
	
	
	

}
