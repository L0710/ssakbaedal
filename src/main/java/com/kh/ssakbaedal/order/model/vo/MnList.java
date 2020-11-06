package com.kh.ssakbaedal.order.model.vo;

import java.util.List;

public class MnList {
	private List<ODetail> mnList;
	
	public MnList() {}

	public MnList(List<ODetail> mnList) {
		super();
		this.mnList = mnList;
	}

	public List<ODetail> getMnList() {
		return mnList;
	}

	public void setMnList(List<ODetail> mnList) {
		this.mnList = mnList;
	}

	@Override
	public String toString() {
		return "mnList [mnList=" + mnList + "]";
	}
	
}
