package com.kh.project.attachment.vo;

public class ProjectAttachmentVo {
	
	public ProjectAttachmentVo() {
		
	}
	
	private String no;
	private String projectNo;
	private String fileSrc;
	private String originName;
	private String changeName;
	private String uploadDate;
	
	
	
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
	public String getFileSrc() {
		return fileSrc;
	}
	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	public ProjectAttachmentVo(String no, String projectNo, String fileSrc, String originName, String changeName,
			String uploadDate) {
		this.no = no;
		this.projectNo = projectNo;
		this.fileSrc = fileSrc;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
	}
	
	@Override
	public String toString() {
		return "ProjectFileVo [no=" + no + ", projectNo=" + projectNo + ", fileSrc=" + fileSrc + ", originName="
				+ originName + ", changeName=" + changeName + ", uploadDate=" + uploadDate + "]";
	}
	
	

}
