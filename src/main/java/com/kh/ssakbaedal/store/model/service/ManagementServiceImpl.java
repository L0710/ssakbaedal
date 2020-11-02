package com.kh.ssakbaedal.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.store.model.dao.ManagementDao;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.SetMenu;
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

	@Override
	public ArrayList<Menu> selectMenu(int mNo) {
		
		return smDao.selectMenu(mNo);
	}

	@Override
	public int updateLong(int mnNo) {
		return smDao.updateLong(mnNo);
	}

	@Override
	public int updateDay(int mnNo) {
		
		return smDao.updateDay(mnNo);
	}

	@Override
	public int updateSale(int mnNo) {
		
		return smDao.updateSale(mnNo);
	}

	@Override
	public int deleteSale(int mnNo) {
		
		return smDao.deleteMenu(mnNo);
	}

	@Override
	public int upBest(int mnNo) {
		
		return smDao.upBest(mnNo);
	}

	@Override
	public int delBest(int mnNo) {
		
		return smDao.delBest(mnNo);
	}

	@Override
	public Menu selectmnName(int mnNo) {
		
		return smDao.selectmnName(mnNo);
	}

	@Override
	public int insertSetMenu(SetMenu sm) {
		
		return smDao.insertSetMenu(sm);
	}

	@Override
	public ArrayList<SetMenu> selectSetMenu(int mNo) {
		
		return smDao.selectSetMenu(mNo);
	}

	@Override
	public int deleteSet(int smNo) {
		
		return smDao.deleteSet(smNo);
	}


}
