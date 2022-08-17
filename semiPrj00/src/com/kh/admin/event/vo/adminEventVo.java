package com.kh.admin.event.vo;

public class adminEventVo {
	
	
	
	public adminEventVo() {
		
	}
	
	
	public adminEventVo(String no, String refAno, String title, String content, String thumbnailPath,
			String thumbnailName, String writeDate, String startDate, String endDate, String importantYN,
			String editDate, String editAdminNo, String deleteYn) {
		super();
		this.no = no;
		this.refAno = refAno;
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
		this.deleteYn = deleteYn;
	}
	
	
	private String no;
	private String refAno;
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
	private String deleteYn;
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getRefAno() {
		return refAno;
	}


	public void setRefAno(String refAno) {
		this.refAno = refAno;
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


	public String getDeleteYn() {
		return deleteYn;
	}


	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}


	@Override
	public String toString() {
		return "adminEventVo [no=" + no + ", refAno=" + refAno + ", title=" + title + ", content=" + content
				+ ", thumbnailPath=" + thumbnailPath + ", thumbnailName=" + thumbnailName + ", writeDate=" + writeDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", importantYN=" + importantYN + ", editDate="
				+ editDate + ", editAdminNo=" + editAdminNo + ", deleteYn=" + deleteYn + "]";
	}

	
	
}
