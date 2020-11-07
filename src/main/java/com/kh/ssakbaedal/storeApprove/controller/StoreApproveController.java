package com.kh.ssakbaedal.storeApprove.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.storeApprove.model.exception.StoreApproveException;
import com.kh.ssakbaedal.storeApprove.model.service.StoreApproveService;
import com.kh.ssakbaedal.storeApprove.model.vo.StoreAppro;

@Controller
public class StoreApproveController {
	@Autowired
	private StoreApproveService saService;
	
	
	/*@RequestMapping("sApproveList.do")
	public String storeApproveList() {
		return "storeApprove/storeApproveList";
	}*/
	
	// 관리자 미승인 매장회원 리스트 출력
	@RequestMapping("sApproveList.do")
	public ModelAndView storeApproveList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = saService.selectListCount();
						
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
						
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<StoreAppro> salist = saService.storeApproveList(pi);
		
		if(salist != null) {
			mv.addObject("salist", salist)
			  .addObject("pi", pi)
			  .setViewName("storeApprove/storeApproveList");
		} else {
			throw new StoreApproveException("업체승인 목록 출력에 실패했습니다");
		}
		
		return mv;
	}
	
	// 관리자 미승인 매장회원 디테일 뷰 출력
	@RequestMapping("saDetail.do")
	public ModelAndView storeApproveDetail(ModelAndView mv,
			@RequestParam("page") Integer page, int mNo) {
		
		StoreAppro storeAppro = saService.selectStoreAp(mNo);
		Attachment at = saService.selectsaFile(mNo);
		
		if(storeAppro != null) {
			mv.addObject("storeAppro", storeAppro)
			  .addObject("at", at)
			  .addObject("page", page)
			  .setViewName("storeApprove/storeApproveDetail");
		} else {
			throw new StoreApproveException("업체승인 디테일 뷰 출력에 실패했습니다.");
		}

		return mv;
	}
	
	// 관리자 미승인 매장회원 승인
	@RequestMapping("sApprove.do")
	public String storeApprove(int mNo, RedirectAttributes rd,
			@RequestParam("page") Integer page) {
		
		StoreAppro storeAppro = saService.selectStoreAp(mNo);
		
		int result = saService.storeApprove(mNo);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "업체 승인이 성공적으로 완료 되었습니다.");
		} else {
			throw new StoreApproveException("업체승인에 실패했습니다.");
		}
		return "redirect:sApproveList.do?page="+page;
	}
	
	
	
	
}
