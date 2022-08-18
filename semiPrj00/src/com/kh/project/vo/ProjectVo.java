package com.kh.project.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ProjectVo {
	
	private String prjectNo;
	private String categoryNo;
	private String name;
	private Timestamp registerDate;
	private Timestamp startDate;
	private Timestamp endDate;
	private int goal;
	private String makerNo;
	private String text;
	private String accountNo;
	private Date shippingDate;
	private String thumbnailName;
	private String thumbnailPath;
	private String etc;
	private String accountBank;
	private String accountName;
	private String makerInfo;
	private String status;
	
	public ProjectVo() {
		
	}

	public ProjectVo(String prjectNo, String categoryNo, String name, Timestamp registerDate, Timestamp startDate,
			Timestamp endDate, int goal, String makerNo, String text, String accountNo, Date shippingDate,
			String thumbnailName, String thumbnailPath, String etc, String accountBank, String accountName,
			String makerInfo, String status) {
		super();
		this.prjectNo = prjectNo;
		this.categoryNo = categoryNo;
		this.name = name;
		this.registerDate = registerDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.goal = goal;
		this.makerNo = makerNo;
		this.text = text;
		this.accountNo = accountNo;
		this.shippingDate = shippingDate;
		this.thumbnailName = thumbnailName;
		this.thumbnailPath = thumbnailPath;
		this.etc = etc;
		this.accountBank = accountBank;
		this.accountName = accountName;
		this.makerInfo = makerInfo;
		this.status = status;
	}

	public String getPrjectNo() {
		return prjectNo;
	}

	public void setPrjectNo(String prjectNo) {
		this.prjectNo = prjectNo;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public String getMakerNo() {
		return makerNo;
	}

	public void setMakerNo(String makerNo) {
		this.makerNo = makerNo;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
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

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getAccountBank() {
		return accountBank;
	}

	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getMakerInfo() {
		return makerInfo;
	}

	public void setMakerInfo(String makerInfo) {
		this.makerInfo = makerInfo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ProjectVo [prjectNo=" + prjectNo + ", categoryNo=" + categoryNo + ", name=" + name + ", registerDate="
				+ registerDate + ", startDate=" + startDate + ", endDate=" + endDate + ", goal=" + goal + ", makerNo="
				+ makerNo + ", text=" + text + ", accountNo=" + accountNo + ", shippingDate=" + shippingDate
				+ ", thumbnailName=" + thumbnailName + ", thumbnailPath=" + thumbnailPath + ", etc=" + etc
				+ ", accountBank=" + accountBank + ", accountName=" + accountName + ", makerInfo=" + makerInfo
				+ ", status=" + status + "]";
	}
	
}
