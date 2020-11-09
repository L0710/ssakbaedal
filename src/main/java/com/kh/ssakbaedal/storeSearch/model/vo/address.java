package com.kh.ssakbaedal.storeSearch.model.vo;

public class address {
	private String add2;
	private String address1;
	
	public address() {}

	public address(String add2, String address1) {
		super();
		this.add2 = add2;
		this.address1 = address1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	@Override
	public String toString() {
		return "address [add2=" + add2 + ", address1=" + address1 + "]";
	}
	
	
}
