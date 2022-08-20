package com.kh.project.report.vo;

public class ProjectReportVo {
	
	public ProjectReportVo() {
		
	}
	
	private String no;
	private String projectNo;
	private String memberNo;
	private String content;
	private String submitDate;
	private String reportAc;
	
	public ProjectReportVo(String no, String projectNo, String memberNo, String content, String submitDate,
			String reportAc) {
		this.no = no;
		this.projectNo = projectNo;
		this.memberNo = memberNo;
		this.content = content;
		this.submitDate = submitDate;
		this.reportAc = reportAc;
	}
	
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
		return "ProjectReportVo [no=" + no + ", projectNo=" + projectNo + ", memberNo=" + memberNo + ", content="
				+ content + ", submitDate=" + submitDate + ", reportAc=" + reportAc + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
