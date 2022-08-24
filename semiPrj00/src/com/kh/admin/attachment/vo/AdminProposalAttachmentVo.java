package com.kh.admin.attachment.vo;

public class AdminProposalAttachmentVo {
	
	
	public AdminProposalAttachmentVo() {
		
	}
	
	
	
	
	public AdminProposalAttachmentVo(String no, String projectNo, String filePath, String originName,
			String changeName, String uploadDate) {
		super();
		this.no = no;
		this.projectNo = projectNo;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
	}




	private String no;
	private String projectNo;
	private String filePath;
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




	public String getFilePath() {
		return filePath;
	}




	public void setFilePath(String filePath) {
		this.filePath = filePath;
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




	@Override
	public String toString() {
		return "AdaminProposalAttachmentVo [no=" + no + ", projectNo=" + projectNo + ", filePath=" + filePath
				+ ", originName=" + originName + ", changeName=" + changeName + ", uploadDate=" + uploadDate + "]";
	}
	
	
	
	

}
