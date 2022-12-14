package com.kh.admin.event.vo;

public class AdminEventVo {
	
	
	
	public AdminEventVo() {
		
	}
	
	
	public AdminEventVo(String no, String adminName, String title, String content, String thumbnailPath,
			String thumbnailName, String writeDate, String startDate, String endDate, String importantYN,
			String editDate, String editAdminNo, String status) {
		super();
		this.no = no;
		this.adminName = adminName;
		this.title = title;
		this.content = content;
		this.thumbnailPath = thumbnailPath;
		this.thumbnailName = thumbnailName;
		this.writeDate = writeDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.importantYN = importantYN;
		this.editDate = editDate;
		this.editAdminNo = editAdminNo;
		this.status = status;
	}
	
	
	private String no;
	private String adminName;
	private String title;
	private String content;
	private String thumbnailPath;
	private String thumbnailName;
	private String writeDate;
	private String startDate;
	private String endDate;
	private String importantYN;
	private String editDate;
	private String editAdminNo;
	private String status;
	
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getAdminName() {
		return adminName;
	}


	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getThumbnailPath() {
		return thumbnailPath;
	}


	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}


	public String getThumbnailName() {
		return thumbnailName;
	}


	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}


	public String getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
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


	public String getImportantYN() {
		return importantYN;
	}


	public void setImportantYN(String importantYN) {
		this.importantYN = importantYN;
	}


	public String getEditDate() {
		return editDate;
	}


	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}


	public String getEditAdminNo() {
		return editAdminNo;
	}


	public void setEditAdminNo(String editAdminNo) {
		this.editAdminNo = editAdminNo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "adminEventVo [no=" + no + ", adminName=" + adminName + ", title=" + title + ", content=" + content
				+ ", thumbnailPath=" + thumbnailPath + ", thumbnailName=" + thumbnailName + ", writeDate=" + writeDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", importantYN=" + importantYN + ", editDate="
				+ editDate + ", editAdminNo=" + editAdminNo + ", status=" + status + "]";
	}

	
	
}
