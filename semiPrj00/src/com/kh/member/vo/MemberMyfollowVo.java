package com.kh.member.vo;

public class MemberMyfollowVo {

	public MemberMyfollowVo() {
		
	}

	public MemberMyfollowVo(String no, String memNo, String makerNo, String nick) {
		super();
		this.no = no;
		this.memNo = memNo;
		this.makerNo = makerNo;
		this.nick = nick;
	}

	private String no;
	private String memNo;
	private String makerNo;
	private String nick;
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMakerNo() {
		return makerNo;
	}

	public void setMakerNo(String makerNo) {
		this.makerNo = makerNo;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "MemberMyfollowVo [no=" + no + ", memNo=" + memNo + ", makerNo=" + makerNo + ", nick=" + nick + "]";
	}
	
}
