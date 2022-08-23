package com.kh.project.notice.vo;

public class ProjectNoticeVo {

	public ProjectNoticeVo() {
		
	}
	
	public ProjectNoticeVo(String no, String projectNo, String memberNo, String content, String newsDate,
			String deleteYn) {
		super();
		this.no = no;
		this.projectNo = projectNo;
		this.memberNo = memberNo;
		this.content = content;
		this.newsDate = newsDate;
		this.deleteYn = deleteYn;
	}

	private String no;
	private String projectNo;
	private String memberNo;
	private String content;
	private String newsDate;
	private String deleteYn;
	
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

	public String getNewsDate() {
		return newsDate;
	}

	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	@Override
	public String toString() {
		return "ProjectNoticeVo [no=" + no + ", projectNo=" + projectNo + ", memberNo=" + memberNo + ", content="
				+ content + ", newsDate=" + newsDate + ", deleteYn=" + deleteYn + "]";
	}
	
	
}
