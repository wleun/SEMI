package com.kh.project.vo;

public class SupportVo {
	
	public SupportVo() {
		
	}
	
	public SupportVo(String no, String rewardNo, String memberNo, String paymentMethodNo, String deliveryAddrNo,
			String donateDate, String amount, String quantity, String additional, String cancelYN, String cancelDate) {
		super();
		this.no = no;
		this.rewardNo = rewardNo;
		this.memberNo = memberNo;
		this.paymentMethodNo = paymentMethodNo;
		this.deliveryAddrNo = deliveryAddrNo;
		this.donateDate = donateDate;
		this.amount = amount;
		this.quantity = quantity;
		this.additional = additional;
		this.cancelYN = cancelYN;
		this.cancelDate = cancelDate;
	}

	private String no;
	private String rewardNo;
	private String memberNo;
	private String paymentMethodNo;
	private String deliveryAddrNo;
	private String donateDate;
	private String amount;
	private String quantity;
	private String additional;
	private String cancelYN;
	private String cancelDate;
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(String rewardNo) {
		this.rewardNo = rewardNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getPaymentMethodNo() {
		return paymentMethodNo;
	}

	public void setPaymentMethodNo(String paymentMethodNo) {
		this.paymentMethodNo = paymentMethodNo;
	}

	public String getDeliveryAddrNo() {
		return deliveryAddrNo;
	}

	public void setDeliveryAddrNo(String deliveryAddrNo) {
		this.deliveryAddrNo = deliveryAddrNo;
	}

	public String getDonateDate() {
		return donateDate;
	}

	public void setDonateDate(String donateDate) {
		this.donateDate = donateDate;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getAdditional() {
		return additional;
	}

	public void setAdditional(String additional) {
		this.additional = additional;
	}

	public String getCancelYN() {
		return cancelYN;
	}

	public void setCancelYN(String cancelYN) {
		this.cancelYN = cancelYN;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	@Override
	public String toString() {
		return "SupportVo [no=" + no + ", rewardNo=" + rewardNo + ", memberNo=" + memberNo + ", paymentMethodNo="
				+ paymentMethodNo + ", deliveryAddrNo=" + deliveryAddrNo + ", donateDate=" + donateDate + ", amount="
				+ amount + ", quantity=" + quantity + ", additional=" + additional + ", cancelYN=" + cancelYN
				+ ", cancelDate=" + cancelDate + "]";
	}

}
