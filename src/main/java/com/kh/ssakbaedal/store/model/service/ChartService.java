package com.kh.ssakbaedal.store.model.service;

import java.util.List;

import com.kh.ssakbaedal.store.model.vo.ChartStatistics;
import com.kh.ssakbaedal.store.model.vo.ChartSum;
import com.kh.ssakbaedal.store.model.vo.MenuChart;

public interface ChartService {

	//월별차트
	List<ChartSum> selectChart(int mNo);

	//메뉴별차트
	List<MenuChart> selectMenuChart(int mNo);

}
