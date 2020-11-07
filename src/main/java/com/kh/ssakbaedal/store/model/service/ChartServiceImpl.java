package com.kh.ssakbaedal.store.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.store.model.dao.ChartDao;
import com.kh.ssakbaedal.store.model.vo.ChartSum;
import com.kh.ssakbaedal.store.model.vo.MenuChart;

@Service("cService")
public class ChartServiceImpl implements ChartService{

	@Autowired
	private ChartDao cDao;

	@Override
	public List<ChartSum> selectChart(int mNo) {
		
		return cDao.selectChart(mNo);
	}

	@Override
	public List<MenuChart> selectMenuChart(int mNo) {
		
		return cDao.selectMenuChart(mNo);
	}
}
