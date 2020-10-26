package com.kh.ssakbaedal.store.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.exception.ManagementException;
import com.kh.ssakbaedal.store.model.service.ManagementService;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.Store;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService smService;
	
	//매장정보 update
	/*@RequestMapping("updateInfo.do")
	public String sInfoUpdate(Store s, String post, String address1, String address2, 
													 RedirectAttributes rd, Model model) {
		
		s.setsAddress(post + "," +address1+","+address2);
		
		
		
		return "redirect:home.do";
		
	}*/
	
	//메뉴 세팅페이지로 이동
	@RequestMapping("menuSetting.do")
	public String goMenuSetting() {
		return "store/management/menuSettingView";
	}
	
	
	
	
	//오픈세팅 페이지로 이동
	@RequestMapping("openSetting.do")
	public ModelAndView goOpenSetting(HttpSession session, ModelAndView mv,
																	@RequestParam(value="page", required=false) Integer page) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int mNo = m.getmNo();
		
		int listCount = smService.selectListCount();
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
		
		ArrayList<OpenDB> list = smService.selectList(pi);
		
		System.out.println(list);
		System.out.println(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
		} else {
			throw new ManagementException("매장 오픈 db 조회 실패");
		}
		
		Store s = smService.selectStore(mNo);
		ArrayList<OpenDB> db = smService.selectDB(mNo);
		
		
		if(s != null) {
			mv.addObject("store", s);
			mv.addObject("db", db);
			mv.setViewName("store/management/openSettingView");
		}
		
		return mv;

	}
	
	//매장상태 update
	@RequestMapping("updatesStatus.do")
	public String updatesStatus(Store s, RedirectAttributes rd,
													@RequestParam("soStatus") String soStatus,
													@RequestParam("start") String start,
													@RequestParam("end") String end) throws ParseException {
		
		OpenDB db = new OpenDB();

		int mNo = s.getmNo();
		int sStatus = Integer.parseInt(soStatus);
		db.setmNo(mNo);
		db.setsStatus(sStatus);
		
		s.setsStatus(sStatus);
		
		if(start != "" && end != "") {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/mm/dd");
/*			
			db.setStartDate(startDate);
			db.setEndDate(endDate);*/
		} 
		int result1 = smService.insertDB(db);
		int result = smService.updatesStatus(s);
		
		return "redirect:openSetting.do";
	}
	
	//매장관리페이지로 이동
	@RequestMapping("storeManage.do")
	public ModelAndView goStoreManage(ModelAndView mv, HttpSession session) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int mNo = m.getmNo();
		
		Store s = smService.selectStore(mNo);
		
		if(s != null) {
			mv.addObject("s", s);
			mv.setViewName("store/management/storeInfoView");
		} else {
			throw new ManagementException("매장 정보 페이지 조회 실패");
		}
		
		return mv;
	}
	
	

}
