package com.kh.member.qanda.vo;

public class MypageQdetailVo {

	public MypageQdetailVo() {
		
	}
	
	public MypageQdetailVo(String no, String memberNo, String makerNo, String title, String content, String writeDate,
			String answerYn, String deleteYn) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.makerNo = makerNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.answerYn = answerYn;
		this.deleteYn = deleteYn;
	}

	private String no;
	private String memberNo;
	private String makerNo;
	private String title;
	private String content;
	private String writeDate;
	private String answerYn;
	private String deleteYn;
	
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

	public String getMakerNo() {
		return makerNo;
	}

	public void setMakerNo(String makerNo) {
		this.makerNo = makerNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getAnswerYn() {
		return answerYn;
	}

	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	@Override
	public String toString() {
		return "MypageQdetailVo [no=" + no + ", memberNo=" + memberNo + ", makerNo=" + makerNo + ", title=" + title
				+ ", content=" + content + ", writeDate=" + writeDate + ", answerYn=" + answerYn + ", deleteYn="
				+ deleteYn + "]";
	}
	
}
