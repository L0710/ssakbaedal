package com.kh.ssakbaedal.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.ssakbaedal.event.model.exception.EventException;
import com.kh.ssakbaedal.order.model.exception.OrderException;
import com.kh.ssakbaedal.order.model.service.OrderService;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;

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
	public ModelAndView goOrderView(ModelAndView mv) {
		
		ArrayList<S_Order> oList = oService.selectList();
		
		if(oList != null) {
			mv.addObject("oList", oList);
			mv.setViewName("store/order/storeOrderView");
		}
		
		return mv;
	}
	
	//5초에 한번씩 orderlist reload
	@RequestMapping("reloadList.do")
	@ResponseBody
	public String reloadList() {
		
		ArrayList<S_Order> oList = oService.selectList();
		ArrayList<SODetail> odList = oService.selectDetailList();
		
		HashMap<String, ArrayList> hm = new HashMap<>();
		hm.put("oList", oList);
		hm.put("odList", odList);
		
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		
		return gson.toJson(hm);
	}
	
	//주문내역이 없어서 일단 주석처리
	//하루가지나면 주문내역 o_status = 'n'
//	@Scheduled(cron="0 0 12 * * * *")
//	public String deleteList(RedirectAttributes rd) {
//		
//		int result = oService.deleteList();
//
//		if(result > 0) {
//			rd.addFlashAttribute("msg", "삭제성공");
//		} else {
//			throw new OrderException("삭제 실패");
//		}
//		
//		return "redirect:orderlist.do";
//	}
//	
	
	@RequestMapping("olist.do")
	public ModelAndView eventList(ModelAndView mv, int mNo,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 1. 전체 게시글 수 리턴 받기
		int listCount = oService.selectListCount(mNo);
//		System.out.println("lCount : " + listCount);
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10 , 5);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Order> olist = oService.selectOList(pi, mNo);
		
		System.out.println("olist : " + olist);
		
//		System.out.println("pi : " + pi);
		
		if(olist != null) {
			mv.addObject("list", olist);
			mv.addObject("pi", pi);
			mv.setViewName("order/orderList_user");
		} else {
			throw new EventException("주문 목록 조회에 실패하였습니다.");
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
	
	@RequestMapping("orderTimePopup.do")
	public String popup() {
		return "store/order/orderTimePopup";
	}
}
