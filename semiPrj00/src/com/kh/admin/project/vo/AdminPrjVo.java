package com.kh.admin.project.vo;

public class AdminPrjVo {
	
	public AdminPrjVo() {
		
	}

	

	public AdminPrjVo(String no, String status, String categoryName, String projectName, String achievementQuotient,
			String makerName, String startDate, String endDate, String reportCnt) {
		super();
		this.no = no;
		this.status = status;
		this.categoryName = categoryName;
		this.projectName = projectName;
		this.achievementQuotient = achievementQuotient;
		this.makerName = makerName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reportCnt = reportCnt;
	}



	private String no;
	private String status;
	private String categoryName;
	private String projectName;
	private String achievementQuotient;
	private String makerName;
	private String startDate;
	private String endDate;
	private String reportCnt;
	
	public String getNo() {
		return no;
	}



	public void setNo(String no) {
		this.no = no;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getProjectName() {
		return projectName;
	}



	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}



	public String getAchievementQuotient() {
		return achievementQuotient;
	}



	public void setAchievementQuotient(String achievementQuotient) {
		this.achievementQuotient = achievementQuotient;
	}



	public String getMakerName() {
		return makerName;
	}



	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}



	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public String getReportCnt() {
		return reportCnt;
	}



	public void setReportCnt(String reportCnt) {
		this.reportCnt = reportCnt;
	}



	@Override
	public String toString() {
		return "AdminPrjVo [no=" + no + ", status=" + status + ", categoryName=" + categoryName + ", projectName="
				+ projectName + ", achievementQuotient=" + achievementQuotient + ", makerName=" + makerName
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", reportCnt=" + reportCnt + "]";
	}

	
	
	





}
