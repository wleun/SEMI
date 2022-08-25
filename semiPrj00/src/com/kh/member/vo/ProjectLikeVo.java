package com.kh.member.vo;

public class ProjectLikeVo {

	public ProjectLikeVo() {
		
	}
	
	public ProjectLikeVo(String no, String memberNo, String projectNo, String status, String projectName,
			String registerDate, String goal) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.projectNo = projectNo;
		this.status = status;
		this.projectName = projectName;
		this.registerDate = registerDate;
		this.goal = goal;
	}

	private String no;
	private String memberNo;
	private String projectNo;
	private String status;
	private String projectName;
	private String registerDate;
	private String goal;
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	@Override
	public String toString() {
		return "ProjectLikeVo [no=" + no + ", memberNo=" + memberNo + ", projectNo=" + projectNo + ", status=" + status
				+ ", projectName=" + projectName + ", registerDate=" + registerDate + ", goal=" + goal + "]";
	}

	
}
