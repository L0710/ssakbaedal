package com.kh.ssakbaedal.order.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.V_Order;

public interface OrderService {
	
	//게시글 조회
	public ArrayList<Order> selectList();
	
	//주문 상세보기
	public Order selectStoreOrder(int oNo);
	
	//주문메뉴 select
	public String selectMenu();
	
	//스케쥴링으로 리스트 지우기
	public int deleteList();

	// 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount(int mNo);

	// 유저 주문 리스트 출력
	public ArrayList<Order> selectOList(PageInfo pi, int mNo);

	// 주문내역 상세(유저)
	public V_Order selectOrder(int oNo);

	
}
