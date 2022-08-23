package com.kh.member.vo;

public class PaymentVo {
	
	public PaymentVo() {
		
	}
	
	public PaymentVo(String no, String memberNo, String cardNum, String validDate, String cardPwd, String birth,
			String password, String registration, String defaultYN) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.cardNum = cardNum;
		this.validDate = validDate;
		this.cardPwd = cardPwd;
		this.birth = birth;
		this.password = password;
		this.registration = registration;
		this.defaultYN = defaultYN;
	}

	private String no;
	private String memberNo;
	private String cardNum;
	private String validDate;
	private String cardPwd;
	private String birth;
	private String password;
	private String registration;
	private String defaultYN;
	
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

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public String getCardPwd() {
		return cardPwd;
	}

	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getDefaultYN() {
		return defaultYN;
	}

	public void setDefaultYN(String defaultYN) {
		this.defaultYN = defaultYN;
	}
	
}
