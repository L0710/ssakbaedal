package com.kh.ssakbaedal.storeApprove.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.storeApprove.model.dao.StoreApproveDao;
import com.kh.ssakbaedal.storeApprove.model.vo.StoreAppro;

@Service("saService")
public class StoreApproveServiceImpl implements StoreApproveService {
	@Autowired
	private StoreApproveDao saDao;
	
	// 관리자 미승인 매장회원 리스트 갯수
	@Override
	public int selectListCount() {
		return saDao.selectListCount();
	}
	
	// 관리자 미승인 매장회원 리스트 출력
	@Override
	public ArrayList<StoreAppro> storeApproveList(PageInfo pi) {
		return saDao.storeApproveList(pi);
	}
	
	// 관리자 미승인 매장회원 디테일 뷰 출력
	@Override
	public StoreAppro selectStoreAp(int mNo) {
		return saDao.selectStoreAp(mNo);
	}
	
	// 관리자 미승인 매장회원 디테일 뷰 출력(파일)
	@Override
	public Attachment selectsaFile(int mNo) {
		return saDao.selectsaFile(mNo);
	}
	
	// 관리자 미승인 매장회원 승인
	@Override
	public int storeApprove(int mNo) {
		return saDao.storeApprove(mNo);
	}
	
	

}
