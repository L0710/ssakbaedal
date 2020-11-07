package com.kh.ssakbaedal.storeApprove.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.storeApprove.model.vo.StoreAppro;

public interface StoreApproveService {
	
	// 관리자 미승인 매장회원 리스트 갯수
	public int selectListCount();
	
	// 관리자 미승인 매장회원 리스트 출력
	public ArrayList<StoreAppro> storeApproveList(PageInfo pi);
	
	// 관리자 미승인 매장회원  디테일 뷰 출력
	public StoreAppro selectStoreAp(int mNo);
	
	// 관리자 미승인 매장회원 디테일 뷰 출력(파일)
	public Attachment selectsaFile(int mNo);
	
	// 관리자 미승인 매장회원 승인
	public int storeApprove(int mNo);

}
