package com.kh.ssakbaedal.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.member.model.dao.MemberDao;
import com.kh.ssakbaedal.member.model.exception.MemberException;
import com.kh.ssakbaedal.order.model.dao.OrderDao;
import com.kh.ssakbaedal.order.model.exception.OrderException;
import com.kh.ssakbaedal.order.model.vo.MnList;
import com.kh.ssakbaedal.order.model.vo.ODetail;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.PayAPI;
import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;
import com.kh.ssakbaedal.order.model.vo.V_Order;


@Service("oService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao oDao;
	@Autowired
	private MemberDao mDao;

	//매장 주문 리스트출력
	@Override
	public ArrayList<S_Order> selectList(int mNo) {

		return oDao.selectList(mNo);
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
	public ArrayList<SODetail> selectDetailList(int mNo) {
		
		return oDao.selectDetailList(mNo);
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

	@Override
	public V_Order selectOrder(int oNo) {
		return oDao.selectOrder(oNo);
	}

	//매장) 주문상태변경
	//배달예상시간 update
	@Override
	public int updateTime(Order order) {
		// TODO Auto-generated method stub
		return oDao.updateTime(order);
	}

	//매장)주문상태변경2
	@Override
	public int updateoStatus(int oNo) {
		
		return oDao.updateoStatus(oNo);
	}


	@Override
	public int cancelOrder(int ono) {
		
		return oDao.cancelOrder(ono);
	}


	// 주문 insert
	@Override
	public int insertOrder(Order o, MnList mnList, int mNo) {
		int result = 0;
		
		result = oDao.insertOrder(o);
//		System.out.println("주문 insert result impl:"+result);
		
		if(result < 0 ) {
			throw new OrderException("주문 실패");
		} else {	// 주문 성공
			result = mDao.usingOrder(o);
//			System.out.println("멤버 포인트, 주문누적 변경 result:" + result);
			
			if(result < 0) {	// 멤버 변경 실패 시
				throw new MemberException("멤버 포인트, 주문누적 변경 실패");
				
			} else {	// 포인트 사용, 주문누적까지 성공
				for(int i = 0; i < mnList.getMnList().size(); i++) {
					ODetail od = mnList.getMnList().get(i);
//				System.out.println("od(i):"+od);
					result = oDao.insertMenu(od);
//				System.out.println("menu insert result:"+result);
					if(result < 0) {
						throw new OrderException("주문 메뉴 insert 실패");
					}
				}
			}
			
		}
		
		return result;
	}

	@Override
	public Order selectOrderInfo() {
		return oDao.selectOrderInfo();
	}

	@Override
	public int insertPayment(PayAPI p) {
		return oDao.insertPayment(p);
	}

	@Override
	public PayAPI selectPaymentInfo() {
		return oDao.selectPaymentInfo();
	}

	
	
	

}
