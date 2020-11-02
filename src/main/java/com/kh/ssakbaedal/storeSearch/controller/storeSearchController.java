package com.kh.ssakbaedal.storeSearch.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.storeSearch.model.exception.storeSearchException;
import com.kh.ssakbaedal.storeSearch.model.service.storeSearchService;
import com.kh.ssakbaedal.storeSearch.model.vo.PageInfo;
import com.kh.ssakbaedal.storeSearch.model.vo.Pagination;
import com.kh.ssakbaedal.storeSearch.model.vo.storeMenu;
import com.kh.ssakbaedal.storeSearch.model.vo.storeSearch;

@Controller
public class storeSearchController {
	
	@Autowired
	private storeSearchService sService;
	
	// 전체매장 보기
	@RequestMapping("tslist.do")
	public ModelAndView totalListView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 1. 전체 게시글 수 리턴 받기
		int listCount = sService.selectListCount();
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
		
		// 페이징 정보에 맞는 게시글 리트트 셀렉
		/*ArrayList<storeSearch> tslist = sService.selectList(pi);*/
		
		HashMap<String, Object> hmap = sService.selectTestList(pi);
		
		//System.out.println("tslist : " + tslist);
		//System.out.println("pi : " + pi);
		System.out.println("toList : " + hmap.get("toList"));
		System.out.println("atList : " + hmap.get("atList"));
		
		/*if(tslist != null) {
			mv.addObject("tslist", tslist);
			mv.addObject("pi", pi);
			mv.setViewName("storeSearch/totalListView");
		} else {
			throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
		}*/
		
		if(hmap.get("toList") != null && hmap.get("atList") != null) {
			mv.addObject("toList", hmap.get("toList"))
			  .addObject("atList", hmap.get("atList"))
			  .addObject("pi", pi)
			  .setViewName("storeSearch/totalListView");
		} else {
			throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 한식 매장 보기
	@RequestMapping("kslist.do")
	public ModelAndView koreanListView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 1. 전체 게시글 수 리턴 받기
		int listCount = sService.selectKsListCount();
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
		
		// 페이징 정보에 맞는 게시글 리트트 셀렉
		ArrayList<storeSearch> kslist = sService.selectKsList(pi);
		
		if(kslist != null) {
			mv.addObject("kslist", kslist);
			mv.addObject("pi", pi);
			mv.setViewName("storeSearch/koreanListView");
		} else {
			throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 중국집 매장 보기
		@RequestMapping("cslist.do")
		public ModelAndView chineseListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
			
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectCsListCount();
			
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
			
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
			
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> cslist = sService.selectCsList(pi);
			
			if(cslist != null) {
				mv.addObject("cslist", cslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/chineseListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
			
			return mv;
		}
		
		// 돈까스,회,일식 매장 보기
		@RequestMapping("jslist.do")
		public ModelAndView japaneseListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
					
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectJsListCount();
					
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
					
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
					
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> jslist = sService.selectjsList(pi);
					
			if(jslist != null) {
				mv.addObject("jslist", jslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/japaneseListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
					
			return mv;
		}
		
		// 분식 매장 보기
		@RequestMapping("sslist.do")
		public ModelAndView streetfoodListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
							
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectSsListCount();
							
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
							
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
							
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> sslist = sService.selectSsList(pi);
							
			if(sslist != null) {
				mv.addObject("sslist", sslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/streetfoodListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
							
			return mv;
		}
		
		// 치킨 매장 보기
		@RequestMapping("chislist.do")
		public ModelAndView chickenListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
									
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectChisListCount();
									
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
									
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
									
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> chislist = sService.selectChisList(pi);
									
			if(chislist != null) {
				mv.addObject("chislist", chislist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/chickenListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
									
			return mv;
		}
		
		// 피자 매장 보기
		@RequestMapping("pslist.do")
		public ModelAndView pizzaListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
											
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectPsListCount();
											
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
											
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
											
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> pslist = sService.selectPsList(pi);
											
			if(pslist != null) {
				mv.addObject("pslist", pslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/pizzaListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
											
			return mv;
		}
		
		// 패스트푸드 매장 보기
		@RequestMapping("fslist.do")
		public ModelAndView fastfoodListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
													
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectFsListCount();
													
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
													
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
													
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> fslist = sService.selectFsList(pi);
													
			if(fslist != null) {
				mv.addObject("fslist", fslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/fastfoodListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
													
			return mv;
		}
		
		// 아시안/양식 매장 보기
		@RequestMapping("aslist.do")
		public ModelAndView asianListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
															
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectAsListCount();
															
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
															
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
															
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> aslist = sService.selectAsList(pi);
															
			if(aslist != null) {
				mv.addObject("aslist", aslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/asianListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
															
			return mv;
		}
		
		// 족발,보쌈 매장 보기
		@RequestMapping("joslist.do")
		public ModelAndView porkFeetListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
																	
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectJosListCount();
																	
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
																	
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
																	
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> joslist = sService.selectJosList(pi);
																	
			if(joslist != null) {
				mv.addObject("joslist", joslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/porkFeetListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
																	
			return mv;
		}
		
		// 족발,보쌈 매장 보기
		@RequestMapping("yaslist.do")
		public ModelAndView yasigListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
																			
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectYasListCount();
																			
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
																			
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
																			
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> yaslist = sService.selectYasList(pi);
																			
			if(yaslist != null) {
				mv.addObject("yaslist", yaslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/yasigListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
																			
			return mv;
		}
		
		// 찜,탕 매장 보기
		@RequestMapping("jjslist.do")
		public ModelAndView jjimListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
																					
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectJjsListCount();
																					
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
																					
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
																					
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> jjslist = sService.selectJjsList(pi);
																					
			if(jjslist != null) {
				mv.addObject("jjslist", jjslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/jjimListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
																					
			return mv;
		}
		
		// 도시락 매장 보기
		@RequestMapping("doslist.do")
		public ModelAndView lunchboxListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
																							
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectDosListCount();
																							
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
																							
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
																							
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> doslist = sService.selectDosList(pi);
																							
			if(doslist != null) {
				mv.addObject("doslist", doslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/lunchboxListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
																							
			return mv;
		}
		
		// 도시락 매장 보기
		@RequestMapping("cdslist.do")
		public ModelAndView cafedessertListView(ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page) {
																									
			// 1. 전체 게시글 수 리턴 받기
			int listCount = sService.selectCdsListCount();
																									
			// 현재 페이지 계산
			int currentPage = page != null ? page : 1;
																									
			// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
																									
			// 페이징 정보에 맞는 게시글 리트트 셀렉
			ArrayList<storeSearch> cdslist = sService.selectCdsList(pi);
																									
			if(cdslist != null) {
				mv.addObject("cdslist", cdslist);
				mv.addObject("pi", pi);
				mv.setViewName("storeSearch/cafedessertListView");
			} else {
				throw new storeSearchException(" 전체 매장 목록 조회에 실패하였습니다.");
			}
																									
			return mv;
		}
		
		// 전체매장 뷰에서 매장 상세정보 뷰로 이동 테스트
		@RequestMapping("sinfoDetail.do")
		public ModelAndView storeDetailView(ModelAndView mv,
				int mNo, @RequestParam("page") Integer page) {
			
			int currentPage = page != null ? page : 1;
			
			storeSearch store = sService.selectstore(mNo);
			Attachment atLogo = sService.selectToslFile(mNo);
			ArrayList<storeMenu> menuList = sService.selectTosMenu(mNo);
			ArrayList<Attachment> atMenuList = sService.selectTosFile(mNo);
			
			System.out.println("store : " + store);
			System.out.println("menuList : " + menuList);
			System.out.println("atMenuList : " + atMenuList);
			System.out.println("atLogo : " + atLogo);
			
			if(store != null) {
				mv.addObject("store", store)
				  .addObject("menuList", menuList)
				  .addObject("atMenuList", atMenuList)
				  .addObject("atLogo", atLogo)
				  .addObject("currentPage", currentPage)
				  .setViewName("storeSearch/storeDetailView");
			} else {
				throw new storeSearchException("매장 상세 정보 출력 실패");
			}
			
			
			return mv;
		}
	
	
}
