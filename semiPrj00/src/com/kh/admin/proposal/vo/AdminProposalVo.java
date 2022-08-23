package com.kh.admin.proposal.vo;

public class AdminProposalVo {
	
	public AdminProposalVo() {
		
	}
	
	
	
	public AdminProposalVo(String no, String nick, String name, String categoryName, String registerDate, String status,
			String startDate, String endDate, int goal, String shippingDate, String text, String thumbnailName,
			String thumbnailPath) {
		super();
		this.no = no;
		this.nick = nick;
		this.name = name;
		this.categoryName = categoryName;
		this.registerDate = registerDate;
		this.status = status;
		this.startDate = startDate;
		this.endDate = endDate;
		this.goal = goal;
		this.shippingDate = shippingDate;
		this.text = text;
		this.thumbnailName = thumbnailName;
		this.thumbnailPath = thumbnailPath;
	}



	private String no;
	private String nick;
	private String name;
	private String categoryName;
	private String registerDate;
	private String status;
	private String startDate;
	private String endDate;
	private int goal;
	private String shippingDate;
	private String text;
	private String thumbnailName;
	private String thumbnailPath;
	
	public String getNo() {
		return no;
	}



	public void setNo(String no) {
		this.no = no;
	}



	public String getNick() {
		return nick;
	}



	public void setNick(String nick) {
		this.nick = nick;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getRegisterDate() {
		return registerDate;
	}



	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public int getGoal() {
		return goal;
	}



	public void setGoal(int goal) {
		this.goal = goal;
	}



	public String getShippingDate() {
		return shippingDate;
	}



	public void setShippingDate(String shippingDate) {
		this.shippingDate = shippingDate;
	}



	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
	}



	public String getThumbnailName() {
		return thumbnailName;
	}



	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}



	public String getThumbnailPath() {
		return thumbnailPath;
	}



	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}



	@Override
	public String toString() {
		return "AdminProposalVo [no=" + no + ", nick=" + nick + ", name=" + name + ", categoryName=" + categoryName
				+ ", registerDate=" + registerDate + ", status=" + status + ", startDate=" + startDate + ", endDate="
				+ endDate + ", goal=" + goal + ", shippingDate=" + shippingDate + ", text=" + text + ", thumbnailName="
				+ thumbnailName + ", thumbnailPath=" + thumbnailPath + "]";
	}
	
	
	
	

}
