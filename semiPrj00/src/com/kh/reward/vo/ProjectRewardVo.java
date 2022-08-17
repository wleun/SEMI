package com.kh.reward.vo;

public class ProjectRewardVo {
	
	public ProjectRewardVo () {
		
	}
	
	private String no;
	private String projectNo;
	private String option;
	private String detail;
	private String price;
	private String quantity;
	
	
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
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public ProjectRewardVo(String no, String projectNo, String option, String detail, String price, String quantity) {
		this.no = no;
		this.projectNo = projectNo;
		this.option = option;
		this.detail = detail;
		this.price = price;
		this.quantity = quantity;
	}
	
	@Override
	public String toString() {
		return "ProjectRewardVo [no=" + no + ", projectNo=" + projectNo + ", option=" + option + ", detail=" + detail
				+ ", price=" + price + ", quantity=" + quantity + "]";
	}
	


}
