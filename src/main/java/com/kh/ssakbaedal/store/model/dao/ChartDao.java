package com.kh.ssakbaedal.store.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.store.model.vo.ChartStatistics;
import com.kh.ssakbaedal.store.model.vo.ChartSum;
import com.kh.ssakbaedal.store.model.vo.MenuChart;

@Repository("cDao")
public class ChartDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ChartSum> selectChart(int mNo) {
		
		return (List)sqlSession.selectList("chartMapper.selectChart", mNo);
	}

	public List<MenuChart> selectMenuChart(int mNo) {
		
		return (List)sqlSession.selectList("chartMapper.selectMenuChart", mNo);
	}
	
}
