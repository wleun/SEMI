package com.kh.addr.vo;

public class AddrVo {
	
	private String no;
	private String memberNo;
	private String postNum;
	private String addr1;
	private String addr2;
	private String name;
	private String phone;
	private String defaultYN;
	
	public AddrVo() {
		
	}
	
	public AddrVo(String no, String memberNo, String postNum, String addr1, String addr2, String name, String phone,
			String defaultYN) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.postNum = postNum;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.name = name;
		this.phone = phone;
		this.defaultYN = defaultYN;
	}

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

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDefaultYN() {
		return defaultYN;
	}

	public void setDefaultYN(String defaultYN) {
		this.defaultYN = defaultYN;
	}

	@Override
	public String toString() {
		return "AddrVo [no=" + no + ", memberNo=" + memberNo + ", postNum=" + postNum + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", name=" + name + ", phone=" + phone + ", defaultYN=" + defaultYN + "]";
	}
	
	

}
