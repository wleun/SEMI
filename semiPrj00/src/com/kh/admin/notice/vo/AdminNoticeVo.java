package com.kh.admin.notice.vo;

public class AdminNoticeVo {
	
	public AdminNoticeVo() {
		
	}
	
	public AdminNoticeVo(String no, String adminName, String title, String content, String thumbnailPath,
			String thumbnailName, String writeDate, String importantYn, String editDate, String editAdminNo,
			String deleteYn) {
		super();
		this.no = no;
		this.adminName = adminName;
		this.title = title;
		this.content = content;
		this.thumbnailPath = thumbnailPath;
		this.thumbnailName = thumbnailName;
		this.writeDate = writeDate;
		this.importantYn = importantYn;
		this.editDate = editDate;
		this.editAdminNo = editAdminNo;
		this.deleteYn = deleteYn;
	}
	
	
	private String no;
	private String adminName;
	private String title;
	private String content;
	private String thumbnailPath;
	private String thumbnailName;
	private String writeDate;
	private String importantYn;
	private String editDate;
	private String editAdminNo;
	private String deleteYn;
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

	public String getImportantYn() {
		return importantYn;
	}

	public void setImportantYn(String importantYn) {
		this.importantYn = importantYn;
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
		return "AdminNoticeVo [no=" + no + ", adminName=" + adminName + ", title=" + title + ", content=" + content
				+ ", thumbnailPath=" + thumbnailPath + ", thumbnailName=" + thumbnailName + ", writeDate=" + writeDate
				+ ", importantYn=" + importantYn + ", editDate=" + editDate + ", editAdminNo=" + editAdminNo
				+ ", deleteYn=" + deleteYn + "]";
	}
	
	
	

}
