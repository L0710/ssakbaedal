package com.kh.ssakbaedal.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.order.model.exception.OrderException;
import com.kh.ssakbaedal.order.model.service.OrderService;
import com.kh.ssakbaedal.order.model.vo.Order;

import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;
import com.kh.ssakbaedal.order.model.vo.V_Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	//list 출력
	@RequestMapping("orderlist.do")
	@ResponseBody
	public String orderList() {
		
		return "order/storeOrderView";
		
	}
	
	//storeorderlist 이동
	@RequestMapping("goOrderView.do")
	public ModelAndView goOrderView(ModelAndView mv,HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
/*		System.out.println(mNo);*/
		
		ArrayList<S_Order> oList = oService.selectList(mNo);
		System.out.println("리스트개수 : "+oList.size());
		for(int i = 0; i < oList.size(); i++) {
			System.out.println(oList.get(3));
		}
		if(oList != null) {
			mv.addObject("oList", oList);
			mv.setViewName("store/order/storeOrderView");
		}
		
		return mv;
	}
	
	//5초에 한번씩 orderlist reload
	@RequestMapping("reloadList.do")
	@ResponseBody
	public String reloadList(String mno) {
		
		int mNo = Integer.parseInt(mno);
		
		ArrayList<S_Order> oList = oService.selectList(mNo);
		ArrayList<SODetail> odList = oService.selectDetailList(mNo);
		
		for(S_Order sorder : oList) {
			for(SODetail sodetail : odList) {
				if (sorder.getoNo() == sodetail.getoNo()) {
					sorder.getList().add(sodetail);
				}
			}
		}
		
		
		HashMap<String, ArrayList> hm = new HashMap<>();
		hm.put("oList", oList);
		hm.put("odList", odList);

		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(hm);

	}
	
	@RequestMapping("olist.do")
	public ModelAndView orderList(ModelAndView mv, int mNo,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 1. 전체 게시글 수 리턴 받기
		int listCount = oService.selectListCount(mNo);
//		System.out.println("lCount : " + listCount);
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5 , 5);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Order> olist = oService.selectOList(pi, mNo);
		
//		System.out.println("olist : " + olist);
//		System.out.println("pi : " + pi);
		
		if(olist != null) {
			mv.addObject("list", olist);
			mv.addObject("pi", pi);
			mv.setViewName("order/orderList_user");
		} else {
			throw new OrderException("주문 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("odetail.do")
	public ModelAndView orderDetail(ModelAndView mv, 
									int oNo, @RequestParam("page") Integer page,
									HttpServletRequest request,
									HttpServletResponse response) {
		
		int currentPage = page != null ? page : 1;
		
		V_Order order = oService.selectOrder(oNo);
		
//		System.out.println("order:"+order);
		
		if(order != null) {
			mv.addObject("o", order)
			  .addObject("currentPage", currentPage)
			  .setViewName("order/orderDetail");
		} else {
			throw new OrderException("주문 상세조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping(value="orderDetail.do", method=RequestMethod.GET)
	public ModelAndView orderDetail(ModelAndView mv, HttpServletRequest request) {
		
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		
		S_Order o = oService.selectStoreOrder(oNo);
		
		
		ArrayList<SODetail> od = oService.selectStoreDetail(oNo);
		
		if(o != null && od != null) {
			mv.addObject("sorder", o);
			mv.addObject("sod", od);
			mv.setViewName("store/order/orderDetailView");
		} else {
			throw new OrderException("주문 상세보기에 실패했습니다.");
		}
		return mv;
		
	}
	
	//주문취소
	@RequestMapping("cancelOrder.do")
	public String cancelOrder(String oNo) {
		
		System.out.println(oNo);
		int ono = Integer.parseInt(oNo);
		int result = oService.cancelOrder(ono);
		if(result <= 0) {
			throw new OrderException("주문취소실패");
		}
		return "redirect:goOrderView.do";
	}
	
	@RequestMapping(value="orderTimePopup.do", method=RequestMethod.GET)
	public ModelAndView popup(ModelAndView mv, HttpServletRequest request) {
		
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		
		System.out.println(oNo);
		
		mv.addObject("oNo", oNo);
		mv.setViewName("store/order/orderTimePopup");
		
		return mv;
	}
	
	//배달예상시간, 주문상태변경
	@RequestMapping("updateTime.do")
	public ModelAndView updateTime(ModelAndView mv,  HttpServletRequest request,
																String value, String oNo) {
	
		
		System.out.println("받아온정보 : " +oNo+value);
		int ono = Integer.parseInt(oNo);
		int ordertime = Integer.parseInt(value);
		
		Order order = new Order();
		order.setoNo(ono);
		order.setArrivalTime(ordertime);
		
		int result = oService.updateTime(order);
		
		if(result > 0) {
			mv.addObject(order);
			mv.setViewName("store/order/storeOrderView");
		} else {
			throw new OrderException("주문상태/배달예상시간 변경 실패");
		}
		
		return mv;
	}
	
	//주문상태변경2->3
	@RequestMapping("updateoStatus2.do")
	public String updateoStatus(int oNo) {
		
		int result = oService.updateoStatus(oNo);
		
		if(result > 0) {
			return "store/order/orderDetailView";
		} else {
			throw new OrderException("주문상태 변경 실패");
		}
		
		
	}
	
}
