package com.kh.member.vo;

import java.sql.*;

public class MemberVo {
	
	private String no;
	private String name;
	private String email;
	private String nick;
	private String pwd;
	private String pwd2;
	private String phone;
	private String type;
	private String registration;
	private java.sql.Timestamp enrollDate;
	private String status;
	private Timestamp quitDate;
	private String mLevel;
	private Timestamp suspendDate;
	private String code;
	//일반생성자
	public MemberVo() {
		
	}
	//매개변수 있는 생성자
	public MemberVo(String no, String name, String email, String nick, String pwd, String pwd2, String phone, String type,
			String registration, Timestamp enrollDate, String status, Timestamp quitDate, String mLevel,
			Timestamp suspendDate, String code) {
		super();
		this.no = no;
		this.name = name;
		this.email = email;
		this.nick = nick;
		this.pwd = pwd;
		this.pwd2 = pwd2;
		this.phone = phone;
		this.type = type;
		this.registration = registration;
		this.enrollDate = enrollDate;
		this.status = status;
		this.quitDate = quitDate;
		this.mLevel = mLevel;
		this.suspendDate = suspendDate;
		this.code = code;
	}
	//게터세터
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	public Timestamp getEnrollDate() {
		return enrollDate;
	}
	public void setEnrolldate(java.sql.Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(Timestamp quitDate) {
		this.quitDate = quitDate;
	}
	public String getmLevel() {
		return mLevel;
	}
	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}
	public Timestamp getSuspendDate() {
		return suspendDate;
	}
	public void setSuspendDate(Timestamp suspendDate) {
		this.suspendDate = suspendDate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	//투스트링
	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", name=" + name + ", email=" + email + ", nick=" + nick + ", pwd=" + pwd
				+ ", pwd2=" + pwd2 + ", phone=" + phone + ", type=" + type + ", registration=" + registration
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", quitDate=" + quitDate + ", mLevel=" + mLevel
				+ ", suspendDate=" + suspendDate + ", code=" + code + "]";
	}
	
	
	
}
