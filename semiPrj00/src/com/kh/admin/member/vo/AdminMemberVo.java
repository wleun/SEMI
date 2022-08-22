package com.kh.admin.member.vo;

public class AdminMemberVo {
	
	
	public AdminMemberVo() {
		
	}
	
	
	public AdminMemberVo(String no, String type, String mLevel, String nick, String email, String phone, String status,
			String enrollDate, String suspendDate, String quitDate, String reportCnt) {
		super();
		this.no = no;
		this.type = type;
		this.mLevel = mLevel;
		this.nick = nick;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.enrollDate = enrollDate;
		this.suspendDate = suspendDate;
		this.quitDate = quitDate;
		this.reportCnt = reportCnt;
	}


	private String no;
	private String type;
	private String mLevel;
	private String nick;
	private String email;
	private String phone;
	private String status;
	private String enrollDate;
	private String suspendDate;
	private String quitDate;
	private String reportCnt;
	
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getmLevel() {
		return mLevel;
	}


	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getSuspendDate() {
		return suspendDate;
	}


	public void setSuspendDate(String suspendDate) {
		this.suspendDate = suspendDate;
	}


	public String getQuitDate() {
		return quitDate;
	}


	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}


	public String getReportCnt() {
		return reportCnt;
	}


	public void setReportCnt(String reportCnt) {
		this.reportCnt = reportCnt;
	}


	@Override
	public String toString() {
		return "AdminMemberVo [no=" + no + ", type=" + type + ", mLevel=" + mLevel + ", nick=" + nick + ", email="
				+ email + ", phone=" + phone + ", status=" + status + ", enrollDate=" + enrollDate + ", suspendDate="
				+ suspendDate + ", quitDate=" + quitDate + ", reportCnt=" + reportCnt + "]";
	}
	
	
	

}
