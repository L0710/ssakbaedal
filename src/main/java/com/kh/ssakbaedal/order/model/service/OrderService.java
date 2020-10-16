package com.kh.ssakbaedal.order.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.event.model.vo.PageInfo;
import com.kh.ssakbaedal.order.model.vo.Order;

public interface OrderService {
	
	//게시글 조회
	public ArrayList<Order> selectList();
	
	//주문 상세보기
	public Order selectStoreOrder(int oNo);
	
	//주문메뉴 select
	public String selectMenu();
	
	//스케쥴링으로 리스트 지우기
	public int deleteList();

	
}
