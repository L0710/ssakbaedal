package com.kh.ssakbaedal.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.store.model.dao.ManagementDao;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.Store;

@Service("smService")
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	private ManagementDao smDao;

	//매장정보 select
	@Override
	public Store selectStore(int mNo) {
		
		return smDao.selectStore(mNo);
	}
	
	@Override
	public ArrayList<OpenDB> selectDB(int mNo) {
	
		return smDao.selectDB(mNo);
	}


	//매장상태 update
	@Override
	public int updatesStatus(Store s) {

		return smDao.updatesStatus(s);
	}

	@Override
	public int insertDB(OpenDB db) {
		
		return smDao.insertDB(db);
	}

	@Override
	public int selectListCount() {
		
		return smDao.selectListCount();
	}

	@Override
	public ArrayList<OpenDB> selectList(PageInfo pi) {
		
		return smDao.selectList(pi);
	}


}
