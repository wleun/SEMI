package com.kh.admin.report.vo;

public class AdminReportVo {
	
	
	public AdminReportVo() {
		
	}
	
	public AdminReportVo(String no, String projectName, String memberNick, String content, String submitDate,
			String reportAc) {
		super();
		this.no = no;
		this.projectName = projectName;
		this.memberNick = memberNick;
		this.content = content;
		this.submitDate = submitDate;
		this.reportAc = reportAc;
	}
	
	private String no;
	private String projectName;
	private String memberNick;
	private String content;
	private String submitDate;
	private String reportAc;
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public String getReportAc() {
		return reportAc;
	}

	public void setReportAc(String reportAc) {
		this.reportAc = reportAc;
	}

	@Override
	public String toString() {
		return "AdminReportVo [no=" + no + ", projectName=" + projectName + ", memberNick=" + memberNick + ", content="
				+ content + ", submitDate=" + submitDate + ", reportAc=" + reportAc + "]";
	}
	
	
}
