package com.kh.ssakbaedal.serviceCenter.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.serviceCenter.model.exception.serviceCenterException;
import com.kh.ssakbaedal.serviceCenter.model.service.serviceCenterService;
import com.kh.ssakbaedal.serviceCenter.model.vo.faq;
import com.kh.ssakbaedal.serviceCenter.model.vo.sc_Search;

@Controller
public class serviceCenterController {
	@Autowired
	private serviceCenterService scService;
	
	// 고객센터 FAQ 목록 출력
	@RequestMapping("service.do")
	public ModelAndView FAQList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = scService.selectListCount();
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<faq> flist = scService.selectList(pi);
		
		//System.out.println(flist);
		
		if(flist != null) {
			mv.addObject("flist", flist);
			mv.addObject("pi", pi);
			mv.setViewName("serviceCenter/FAQList");
		} else {
			throw new serviceCenterException("FAQ 게시글 목록 조회 실패");
		}
		
		return mv;
	}
	
	// FAQ 게시글 디테일 뷰 이동
	@RequestMapping("FAQDetail.do")
	public ModelAndView FAQDetailView(ModelAndView mv,
									int fNo, @RequestParam("page") Integer page,
									@RequestParam("searchCondition") String searchCondition,
									@RequestParam("searchValue") String searchValue) {
		
		int currentPage = page != null ? page : 1;
		
		faq faq = scService.selectFaq(fNo);
		
		if(faq != null) {
			mv.addObject("faq", faq);
			mv.addObject("currentPage", currentPage);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.setViewName("serviceCenter/FAQDetailView");
		} else {
			throw new serviceCenterException("FAQ 게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	// FAQ 인설트 뷰 이동
	@RequestMapping("inFAQ.do")
	public String FAQInsertView() {
		return "serviceCenter/FAQInsertView";
	}
	
	// FAQ 게시글 작성
	@RequestMapping("faqInsert.do")
	public String FAQInsert(faq f) {
		
		int result = scService.FAQInsert(f);
		
		if(result > 0) {
			return "redirect:service.do";
		} else {
			throw new serviceCenterException("FAQ 게시글 작성 실패");
		}
	}
	
	// FAQ 게시글 수정 뷰 이동
	@RequestMapping("upFAQView.do")
	public ModelAndView FAQUpdateView(ModelAndView mv, int fNo,
									@RequestParam("page") Integer page) {
		faq dFaq = scService.selectFaq(fNo);
		
		if(dFaq != null) {
			mv.addObject("dFaq", dFaq);
			mv.addObject("currentPage", page);
			mv.setViewName("serviceCenter/FAQUpdateView");
		} else {
			throw new serviceCenterException("FAQ 게시글 수정 뷰 이동 실패");
		}
		
		return mv;
	}
	
	// FAQ 게시글 수정 
	@RequestMapping("upFAQ.do")
	public ModelAndView FAQUpdate(ModelAndView mv, faq f,
								@RequestParam("page") Integer page) {
		
		int result = scService.FAQUpdate(f);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:service.do");
		} else {
			throw new serviceCenterException("FAQ 게시글 수정 실패");
		}
		
		return mv;
	}
	
	// FAQ 게시글 삭제
	@RequestMapping("FAQDelete.do")
	public String faqDelete(int fNo) {
		int result = scService.faqDelete(fNo);
		
		if(result > 0) {
			return "redirect:service.do";
		} else {
			throw new serviceCenterException("FAQ 게시글 삭제 실패");
		}
	}
	
	// FAQ 게시글 검색
	@RequestMapping("scSearch.do")
	public ModelAndView faqSearch(ModelAndView mv, 
			sc_Search search,
			@RequestParam(value="page", required=false) Integer page) {
		
		//System.out.println(search);
		
		// 전체 게시글 수 리턴 받기
		int listCount = scService.searchListCount(search);
				
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
				
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<faq> faqSearchList = scService.faqSearchList(search, pi);
		
		if(faqSearchList != null) {
			mv.addObject("flist", faqSearchList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("serviceCenter/FAQList");			
		} else {
			throw new serviceCenterException("FAQ 게시글 목록 검색 실패");
		}
		
		return mv;
	}
	
	
}
