package com.kh.admin.attachment.vo;

public class AdminNoticeAttachmentVo {
	
	
	public AdminNoticeAttachmentVo() {
		
	}
	
	
	public AdminNoticeAttachmentVo(String no, String noticeNo, String path, String name, String uploadDate,
			String deleteYn) {
		this.no = no;
		this.noticeNo = noticeNo;
		this.path = path;
		this.name = name;
		this.uploadDate = uploadDate;
		this.deleteYn = deleteYn;
	}




	private String no;
	private String noticeNo;
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




	public String getNoticeNo() {
		return noticeNo;
	}




	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
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
		return "AdminNoticeAttachmentVo [no=" + no + ", noticeNo=" + noticeNo + ", path=" + path + ", name=" + name
				+ ", uploadDate=" + uploadDate + ", deleteYn=" + deleteYn + "]";
	}
	
	
	
	

}
