package com.kh.ssakbaedal.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.order.model.exception.OrderException;
import com.kh.ssakbaedal.order.model.service.OrderService;
import com.kh.ssakbaedal.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@RequestMapping("orderlist.do")
	@ResponseBody
	public String orderList() {
		
		return "order/storeOrderView";
		
	}
	
	@RequestMapping("goOrderView.do")
	public String goOrderView() {
		return "store/order/storeOrderView";
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
	
	

}
