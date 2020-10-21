package com.kh.ssakbaedal.order.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;

public interface OrderService {
	
	//게시글 조회
	public ArrayList<S_Order> selectList();
	
	//주문 상세보기
	public S_Order selectStoreOrder(int oNo);
	public ArrayList<SODetail> selectStoreDetail(int oNo);
	
	//스케쥴링으로 리스트 지우기
	public int deleteList();

	// 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount(int mNo);

	// 유저 주문 리스트 출력
	public ArrayList<Order> selectOList(PageInfo pi, int mNo);

	//매장 주문 디테일
	public ArrayList<SODetail> selectDetailList();

	
}
