package com.kh.ssakbaedal.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.order.model.dao.OrderDao;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;

@Service("oService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao oDao;


	//매장 주문 리스트출력
	@Override
	public ArrayList<S_Order> selectList() {

		return oDao.selectList();
	}

	//스케쥴링으로 리스트 지우기
	@Override
	public int deleteList() {

		return oDao.deleteList();
	}

	@Override
	public int selectListCount(int mNo) {
		return oDao.selectListCount(mNo);
	}

	@Override
	public ArrayList<Order> selectOList(PageInfo pi, int mNo) {
		return oDao.selectOList(pi, mNo);
	}

	//매장 주문 디테일 리스트
	@Override
	public ArrayList<SODetail> selectDetailList() {
		
		return oDao.selectDetaillList();
	}

	//매장 주문 상세보기로 이동1
	@Override
	public S_Order selectStoreOrder(int oNo) {
		System.out.println(oNo);
		return oDao.selectStoreOrder(oNo);
	}
	
	//매장 주문 상세보기로 이동2
	@Override
	public ArrayList<SODetail> selectStoreDetail(int oNo) {

		return oDao.selectStoreDetail(oNo);
	}
	
	
	

}
