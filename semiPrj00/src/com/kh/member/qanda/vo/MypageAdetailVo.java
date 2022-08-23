package com.kh.member.qanda.vo;

public class MypageAdetailVo {

	public MypageAdetailVo() {
		
	}
	
	public MypageAdetailVo(String no, String makerQuestionNo, String title, String content, String writeDate,
			String correctedDate, String deleteYn) {
		super();
		this.no = no;
		this.makerQuestionNo = makerQuestionNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.correctedDate = correctedDate;
		this.deleteYn = deleteYn;
	}

	private String no;
	private String makerQuestionNo;
	private String title;
	private String content;
	private String writeDate;
	private String correctedDate;
	private String deleteYn;
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMakerQuestionNo() {
		return makerQuestionNo;
	}

	public void setMakerQuestionNo(String makerQuestionNo) {
		this.makerQuestionNo = makerQuestionNo;
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

	public String getCorrectedDate() {
		return correctedDate;
	}

	public void setCorrectedDate(String correctedDate) {
		this.correctedDate = correctedDate;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	@Override
	public String toString() {
		return "MypageAdetailVo [no=" + no + ", makerQuestionNo=" + makerQuestionNo + ", title=" + title + ", content="
				+ content + ", writeDate=" + writeDate + ", correctedDate=" + correctedDate + ", deleteYn=" + deleteYn
				+ "]";
	}
	
}
