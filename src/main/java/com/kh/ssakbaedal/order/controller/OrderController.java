package com.kh.ssakbaedal.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;

import com.kh.ssakbaedal.member.model.service.MemberService;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.order.model.exception.OrderException;
import com.kh.ssakbaedal.order.model.service.OrderService;
import com.kh.ssakbaedal.order.model.vo.MnList;
import com.kh.ssakbaedal.order.model.vo.ODetail;
import com.kh.ssakbaedal.order.model.vo.Order;

import com.kh.ssakbaedal.order.model.vo.PayAPI;
import com.kh.ssakbaedal.order.model.vo.SODetail;
import com.kh.ssakbaedal.order.model.vo.S_Order;
import com.kh.ssakbaedal.order.model.vo.V_Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	@Autowired
	private MemberService mService;
	
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
/*		System.out.println(oList);*/
		
/*		System.out.println("리스트개수 : "+oList.size());
		for(int i = 0; i < oList.size(); i++) {
			System.out.println(oList.get(3));
		}*/
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
/*		System.out.println(oList);
		System.out.println(odList);*/
		
/*		for(S_Order sorder : oList) {
			for(SODetail sodetail : odList) {
				if (sorder.getoNo() == sodetail.getoNo()) {
					sorder.getList().add(sodetail);
				}
			}
		}*/
		
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
		
		System.out.println("olist : " + olist);
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
		System.out.println(oNo);
		S_Order o = oService.selectStoreOrder(oNo);

		ArrayList<SODetail> odList = oService.selectStoreDetail(oNo);
//		System.out.println("sod : " +odList);
		
		if(o != null && odList != null) {
			mv.addObject("sorder", o);
			mv.addObject("sod", odList);
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
	
	@RequestMapping("oinsertView.do")
	public ModelAndView orderInsertView(ModelAndView mv, @ModelAttribute MnList mnList,  int deliveryCharge, int mNo, int sNo) {
//		System.out.println("mnList:"+mnList);
//		System.out.println("deliveryCharge:"+deliveryCharge);
//		System.out.println("mNo:"+mNo);
		Order order = new Order();
		order.setDeliveryCharge(deliveryCharge);
		order.setmNo(mNo);
		order.setSmNo(sNo);
		
		Member member = mService.selectMemberInfo(mNo);
//		System.out.println("member:"+member);
//		System.out.println("order:"+order);
		ArrayList<ODetail> mList = (ArrayList<ODetail>) mnList.getMnList();
//		System.out.println(mList);
		
		if(mList != null && member != null) {
			mv.addObject("mList", mList)
			.addObject(order)
			.addObject(member)
			.setViewName("order/orderView");
		} else {
			throw new OrderException("주문 뷰 이동 실패");
		}
		return mv;
	}
	
	@RequestMapping("orderInsert.do")
	public ModelAndView orderInsert(ModelAndView mv, Order o, @RequestParam(value="usedPoint", required=false) Integer usedPoint,
				@RequestParam("address1") String address1, @RequestParam("address2") String address2, @ModelAttribute MnList mnList) {

		if(usedPoint == null) {	// 포인트 사용하지 않아 usedPoint 값이 0으로 들어왔을 경우
			usedPoint = 0;
			o.setoPoint(usedPoint);
		} else {	// 포인트 사용했을 경우 order에 해당 값 세팅
			o.setoPoint(usedPoint);
		}
		o.setoAddress(address1 + ", " + address2);	// 도로명주소 + 상세주소
		
		
		int mNo = o.getmNo();	// 포인트 차감, 주문금액 누적할 멤버 번호
		int result = oService.insertOrder(o, mnList, mNo);
		
		if(result > 0) {
			Order order = oService.selectOrderInfo();
			mv.addObject("order", order);
			mv.setViewName("order/paymentAPI");
		} else {
			throw new OrderException("주문 입력 실패");
		}
		return mv;
	}
	
	@RequestMapping("paymentSuccess.do")
	@ResponseBody
	public String paymentInsert(ModelAndView mv, PayAPI p) {
		
		int result = oService.insertPayment(p);
		
		
		if(result > 0) {
			return "success";
			
		} else {
			throw new OrderException("결제 실패");
		}
	}
	
	@RequestMapping("pComplete.do")
	public ModelAndView paymentComplete(ModelAndView mv) {
		PayAPI payment = oService.selectPaymentInfo();
		
		Order order = oService.selectOrderInfo();
		
		if(payment != null && order != null) {
			mv.addObject("payment", payment);
			mv.addObject("order", order);
			mv.setViewName("order/paymentComplete");
		} else {
			throw new OrderException("결제 뷰 이동 실패");
		}
		
		return mv;
	}
}
