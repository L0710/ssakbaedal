package com.kh.ssakbaedal.common.no;

public class No {
	private int aNo;	// 첨부파일 번호
	private int oNo;	// 주문 번호
	private int rNo;	// 리뷰 번호
	private int mNo;	// 멤버 번호
	
	public No() {}

	public No(int aNo, int oNo, int rNo, int mNo) {
		super();
		this.aNo = aNo;
		this.oNo = oNo;
		this.rNo = rNo;
		this.mNo = mNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "No [aNo=" + aNo + ", oNo=" + oNo + ", rNo=" + rNo + ", mNo=" + mNo + "]";
	}
	
}
