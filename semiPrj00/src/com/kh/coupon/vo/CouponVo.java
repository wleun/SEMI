package com.kh.coupon.vo;

public class CouponVo {
	//기본 생성자
	public CouponVo(){
		
	}
	
	private String no;
	private String memNo;
	private String name;
	private int discount;
	
	//매개변수 생성자
	public CouponVo(String no, String memNo, String name, int discount) {
		super();
		this.no = no;
		this.memNo = memNo;
		this.name = name;
		this.discount = discount;
	}

	
	//getter/setter
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	//투스트링
	@Override
	public String toString() {
		return "CouponVo [no=" + no + ", memNo=" + memNo + ", name=" + name + ", discount=" + discount + "]";
	}
	
	
	
	
	
}
