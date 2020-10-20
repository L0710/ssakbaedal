package com.kh.ssakbaedal.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.event.model.exception.EventException;
import com.kh.ssakbaedal.order.model.exception.OrderException;
import com.kh.ssakbaedal.order.model.service.OrderService;
import com.kh.ssakbaedal.order.model.vo.Order;
import com.kh.ssakbaedal.order.model.vo.V_Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@RequestMapping("orderlist.do")
	@ResponseBody
	public String orderList() {
		
		return "order/storeOrderView";
		
	}
	
	@RequestMapping("reloadList.do")
	@ResponseBody
	public String reloadList() {
		
		ArrayList<Order> oList = oService.selectList();
		String menuList = oService.selectMenu();
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		
		
		return gson.toJson(oList);
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
}
