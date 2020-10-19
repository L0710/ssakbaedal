package com.kh.ssakbaedal.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.event.model.vo.PageInfo;
import com.kh.ssakbaedal.order.model.dao.OrderDao;
import com.kh.ssakbaedal.order.model.vo.Order;

@Service("oService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao oDao;

	@Override
	public Order selectStoreOrder(int oNo) {
		
		return null;
	}

	@Override
	public ArrayList<Order> selectList() {

		return oDao.selectList();
	}

	@Override
	public String selectMenu() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteList() {

		return oDao.deleteList();
	}
	
	
	

}