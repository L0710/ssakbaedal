package com.kh.ssakbaedal.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.order.model.vo.ODetail;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.PayAPI;
import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;
import com.kh.ssakbaedal.order.model.vo.V_Order;

@Repository("oDao")
public class OrderDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<S_Order> selectList() {

		return (ArrayList)sqlSession.selectList("orderMapper.selectorderList");
	}

	public int deleteList() {

		return sqlSession.update("orderMapper.deleteList");
	}

	public int selectListCount(int mNo) {
		return sqlSession.selectOne("orderMapper.selectListCount", mNo);
	}

	public ArrayList<Order> selectOList(PageInfo pi, int mNo) {
		// 1 - offset : 몇 개의 게시글을 건너 뛸 것인지
		// 2 - boardLimit : 몇 개의 게시글을 select 할 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("orderMapper.selectOList", mNo, rowBounds);
	}

	public ArrayList<SODetail> selectDetaillList() {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectodList");
	}


	public S_Order selectStoreOrder(int oNo) {
		
		return sqlSession.selectOne("orderMapper.selectStoreOrder", oNo);
	}

	public ArrayList<SODetail> selectStoreDetail(int oNo) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectStoreDetail", oNo);
	}


	public int updateTime(Order order) {
		
		return sqlSession.update("orderMapper.updateTime", order);
	}

	public int updateoStatus(int oNo) {
		
		return sqlSession.update("orderMapper.updateoStatus", oNo);
	}

	public V_Order selectOrder(int oNo) {
		return sqlSession.selectOne("orderMapper.selectOne", oNo);
	}

	public int insertOrder(Order o) {
		return sqlSession.insert("orderMapper.insertOrder", o);
	}

	// 주문한 메뉴 odetail 테이블에 insert
	public int insertMenu(ODetail od) {
		return sqlSession.insert("orderMapper.insertMenu", od);
	}

	public Order selectOrderInfo() {
		return sqlSession.selectOne("orderMapper.selectOrderInfo");
	}

	public int insertPayment(PayAPI p) {
		return sqlSession.insert("orderMapper.insertPayment", p);
	}

	public PayAPI selectPaymentInfo() {
		return sqlSession.selectOne("orderMapper.selectPaymentInfo");
	}
	

	
}
