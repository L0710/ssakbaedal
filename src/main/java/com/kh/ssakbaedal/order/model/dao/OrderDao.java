package com.kh.ssakbaedal.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.order.model.vo.Order;

@Repository("oDao")
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Order> selectList() {

		return (ArrayList)sqlSession.selectList("orderMapper.selectorderList");
	}

	public int deleteList() {

		return sqlSession.update("orderMapper.deleteList");
	}
	
	
}
