package com.kh.ssakbaedal.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.exception.ManagementException;
import com.kh.ssakbaedal.store.model.service.ManagementService;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.SetMenu;
import com.kh.ssakbaedal.store.model.vo.Store;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService smService;
	

	
	//메뉴 세팅페이지로 이동
	@RequestMapping("menuSetting.do")
	public ModelAndView goMenuSetting(HttpSession session,ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
		
		Store s = smService.selectStore(mNo);
		ArrayList<Menu> menu = smService.selectMenu(mNo);
		ArrayList<SetMenu> set = smService.selectSetMenu(mNo); 
		ArrayList<Attachment> attach = smService.selectImg(mNo);
		
		if(menu != null) {
			mv.addObject("s", s);
			mv.addObject("menu", menu);
			mv.addObject("set", set);
			mv.addObject("attach", attach);
			mv.setViewName("store/management/menuSettingView");
		} else {
			throw new ManagementException("메뉴정보 출력실패");
		}
		
		return  mv;
	}
	
	//품절처리
	@RequestMapping("updateSoldout.do")
	public String updateSoldout(String mnno, String select) {
		
		int mnNo = Integer.parseInt(mnno);
		
		if(select.equals("long")) {
			int result1 = smService.updateLong(mnNo);

		} else if (select.equals("day")) {
			int result2 = smService.updateDay(mnNo);

		} 
		
		return "redirect:store/management/menuSettingView";
	}
	
	//품절해제
	@RequestMapping("updateSale.do")
	public String updateSale(String mnno) {
		
		int mnNo = Integer.parseInt(mnno);
		
		int result = smService.updateSale(mnNo);
		
		return "redirect:store/management/menuSettingView";
	}
	

	
	//베스트메뉴로 등록
	@RequestMapping("upbest.do")
	public String upbest(String mnno) {
		
		int mnNo = Integer.parseInt(mnno);
		
		int result = smService.upBest(mnNo);
		
		return  "redirect:store/management/menuSettingView";
	}
	
	//베스트메뉴 등록 해제
	@RequestMapping("delbest.do")
	public String delBest(String mnno) {
		
		int mnNo = Integer.parseInt(mnno);
		
		int result = smService.delBest(mnNo);
		
		return "redirect:store/management/menuSettingView";
	}
	
	//세트메뉴추가
	@RequestMapping("insertSet.do")
	public String insertSet(String setName,String sumMnno, int mnprice, HttpSession session) {

		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
		SetMenu sm = new SetMenu();
		String no = sumMnno.substring(0, sumMnno.length()-1);
		
		String[] sArr = no.split(",");
		
		String nameList = "";
		
		for(int i = 0; i < sArr.length; i++) {
			
			int mnNo = Integer.parseInt(sArr[i]);
			
			Menu me = smService.selectmnName(mnNo);
			
			if(me != null) {
				nameList += me.getMnName()+",";
			} else {
				break;
			}
		}
		String smName = nameList.substring(0, nameList.length()-1);
		
		sm.setSmName(setName);
		sm.setSetList(smName);
		sm.setSetPrice(mnprice);
		sm.setmNo(mNo);
		sm.setSet_mnNo(no);
		
		
		int result = smService.insertSetMenu(sm);
		if(result < 0 ) {
			throw new ManagementException("세트메뉴 추가 실패");
		}

		return "redirect:menuSetting.do";
	}
	
	//세트메뉴 삭제
	@RequestMapping("setdel.do") 
	public ModelAndView setDelete(String smno, ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
		int smNo = Integer.parseInt(smno);
		System.out.println(smNo);
		int result = smService.deleteSet(smNo);

		if(result <= 0) {
			throw new ManagementException("세트메뉴 삭제 실패");
		}
		
		ArrayList<SetMenu> set = smService.selectSetMenu(mNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		mv.addObject("set", set);
		mv.addObject(gson.toJson(set));
		mv.setViewName("store/management/menuSettingView");
		
		return mv;
	}
	
	
	//오픈세팅 페이지로 이동
	@RequestMapping("openSetting.do")
	public ModelAndView goOpenSetting(HttpSession session, ModelAndView mv,
																	@RequestParam(value="page", required=false) Integer page) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int mNo = m.getmNo();
		
		int listCount = smService.selectListCount(mNo);
		
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
													@RequestParam("end") String end) throws ParseException{
		
		System.out.println("update : " + start+end);
		OpenDB db = new OpenDB();

		int mNo = s.getmNo();
		int sStatus = Integer.parseInt(soStatus);
		db.setmNo(mNo);
		db.setsStatus(sStatus);
		
		s.setsStatus(sStatus);
		
		if(start != null && end != null) {
			
			System.out.println("a");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			
			String sDate = start.replace("-", "");
			System.out.println(sDate);
			
			String eDate = end.replace("-", "");
			System.out.println(eDate);
			
			db.setStartDate(sDate);
			db.setEndDate(eDate);

		} 
		
		int result1 = smService.insertDB(db);
		int result = smService.updatesStatus(s);
		
		return "redirect:openSetting.do";
	}
	

	
	

}
