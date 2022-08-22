package com.kh.admin.attachment.vo;

public class AdminEventAttachmentVo {
	
	
	
	public AdminEventAttachmentVo(String no, String eventNo, String path, String name, String uploadDate,
			String deleteYn) {
		this.no = no;
		this.eventNo = eventNo;
		this.path = path;
		this.name = name;
		this.uploadDate = uploadDate;
		this.deleteYn = deleteYn;
	}
	
	
	public AdminEventAttachmentVo() {
		
	}
	
	
	private String no;
	private String eventNo;
	private String path;
	private String name;
	private String uploadDate;
	private String deleteYn;
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getEventNo() {
		return eventNo;
	}


	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}


	public String getDeleteYn() {
		return deleteYn;
	}


	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}


	@Override
	public String toString() {
		return "AdminEventAttachmentVo [no=" + no + ", eventNo=" + eventNo + ", path=" + path + ", name=" + name
				+ ", uploadDate=" + uploadDate + ", deleteYn=" + deleteYn + "]";
	}
	
	
	
	
	

}
