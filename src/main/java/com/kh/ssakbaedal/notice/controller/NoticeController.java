package com.kh.ssakbaedal.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.notice.model.exception.NoticeException;
import com.kh.ssakbaedal.notice.model.service.NoticeService;
import com.kh.ssakbaedal.notice.model.vo.Notice;
import com.kh.ssakbaedal.notice.model.vo.nSearch;
import com.kh.ssakbaedal.serviceCenter.model.exception.serviceCenterException;
import com.kh.ssakbaedal.serviceCenter.model.vo.faq;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	// 관리자 공지사항 리스트 뷰 출력
	@RequestMapping("nlist.do")
	public ModelAndView adminNoticeListView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = nService.selectListCount();
				
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
				
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Notice> nlist = nService.selectnList(pi);
		
		if(nlist != null) {
			mv.addObject("nlist", nlist)
			  .addObject("pi", pi)
			  .setViewName("notice/adminNoticeListView");
		} else {
			throw new NoticeException("공지사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 고객센터 공지사항 리스트 뷰 출력
	@RequestMapping("tnlist.do")
	public ModelAndView totalNoticeListView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = nService.selectTnListCount();
						
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
						
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Notice> tnlist = nService.selectTnList(pi);
		
		if(tnlist != null) {
			mv.addObject("tnlist", tnlist)
			  .addObject("pi", pi)
			  .setViewName("notice/totlaNoticeListView");
		} else {
			throw new NoticeException("고객센터 공지사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 매장회원 공지사항 리스트 뷰 출력
	@RequestMapping("snlist.do")
	public ModelAndView storeNoticeListView(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = nService.selectSnListCount();
								
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
								
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
				
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Notice> snlist = nService.selectSnList(pi);
				
		if(snlist != null) {
			mv.addObject("snlist", snlist)
			  .addObject("pi", pi)
			  .setViewName("notice/storeNoticeListView");
		} else {
			throw new NoticeException("매장회원 공지사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 관리자 공지사항 디테일 뷰 출력
	@RequestMapping("anDetail.do")
	public ModelAndView aNoticeDetailView(ModelAndView mv,
			int nId, @RequestParam("page") Integer page,
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchValue") String searchValue) {
		
		int currentPage = page != null ? page : 1;
		
		Notice notice = nService.selectaNotice(nId);
		Attachment at = nService.selectaNoticeFile(nId);
		
		if(notice != null) {
			mv.addObject("notice", notice)
			  .addObject("at", at)
			  .addObject("currentPage", currentPage)
			  .addObject("searchCondition", searchCondition)
			  .addObject("searchValue", searchValue)
			  .setViewName("notice/aNoticeDetailView");
		} else {
			throw new NoticeException("공지사항 게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	// 고객센터 공지사항 디테일 뷰 출력
	@RequestMapping("tnDetail.do")
	public ModelAndView tNoticeDetailView(ModelAndView mv,
			int nId, @RequestParam("page") Integer page,
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchValue") String searchValue) {
		
		int currentPage = page != null ? page : 1;
		
		Notice notice = nService.selectToNotice(nId);
		Attachment at = nService.selectToNoticeFile(nId);
		
		if(notice != null) {
			mv.addObject("notice", notice)
			  .addObject("at", at)
			  .addObject("currentPage", currentPage)
			  .addObject("searchCondition", searchCondition)
			  .addObject("searchValue", searchValue)
			  .setViewName("notice/tNoticeDetailView");
		} else {
			throw new NoticeException("공지사항 게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	// 매장회원 공지사항 디테일 뷰 출력
	@RequestMapping("snDetail.do")
	public ModelAndView sNoticeDetailView(ModelAndView mv,
			int nId, @RequestParam("page") Integer page,
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchValue") String searchValue) {
		
		int currentPage = page != null ? page : 1;
		
		Notice notice = nService.selectSnNotice(nId);
		Attachment at = nService.selectSnNoticeFile(nId);
		
		if(notice != null) {
			mv.addObject("notice", notice)
			  .addObject("at", at)
			  .addObject("currentPage", currentPage)
			  .addObject("searchCondition", searchCondition)
			  .addObject("searchValue", searchValue)
			  .setViewName("notice/sNoticeDetailView");
		} else {
			throw new NoticeException("공지사항 게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	// 관리자 공지사항 작성 뷰 이동 테스트
	@RequestMapping("innView.do")
	public String noticeInsertView() {
		return "notice/noticeInsertView";
	}
	
	// 관리자 공지사항 작성
	@RequestMapping("nInsert.do")
	public String noticeInsert(Notice n, HttpServletRequest request, Attachment at,
			@RequestParam(value="uploadFile", required=false) MultipartFile file ) {
		
		int result = 0;
		
		// 파일이 업로드 되었다면 (업로드 된 파일명이 ""가 아니라면)
		if(!file.getOriginalFilename().equals("")) {
			// 파일명 리네임 후 지정 경로에 파일을 저장하는 별도 메소드를 통해 저장
			String renameFileName = saveFile(file, request);
			
			String savePath = savePath(file, renameFileName, request);
			
			// 파일 저장이 잘 되었다면 DB로 보낼 Attachment에 파일명 관련 컬럼을 채워줌
			if(renameFileName != null) {
				at.setOriginalFileName(file.getOriginalFilename());
				at.setChangeFileName(renameFileName);
				at.setFilePath(savePath);
			}
			result = nService.noticeInsertFile(n, at);
		} else {
			result = nService.noticeInsert(n);
		}
		
		if(result > 0) {
			return "redirect:nlist.do";
		} else {
			throw new NoticeException("공지사항 게시글 작성에 실패");
		}
		
		
	}
	
	// 관리자 공지사항 수정 뷰 출력
	@RequestMapping("upnView.do")
	public ModelAndView noticeUpdateView(ModelAndView mv, int nId,
			@RequestParam("page") Integer page) {
		
		Notice notice = nService.selectaNotice(nId);
		Attachment at = nService.selectaNoticeFile(nId);
		
		if(notice != null) {
			mv.addObject("notice", notice)
			  .addObject("at", at)
			  .addObject("currentPage", page)
			  .setViewName("notice/noticeUpdateView");
		} else {
			throw new NoticeException("공지사항 수정 뷰 출력 실패");
		}
		
		return mv;
	}
	
	// 관리자 공지사항 수정
	@RequestMapping("nUpdate.do")
	public ModelAndView noticeUpdate(ModelAndView mv, Notice n, Attachment at,
			HttpServletRequest request,
			@RequestParam("page") Integer page,
			@RequestParam(value="reloadFile", required=false) MultipartFile file) {
		
		int result = 0;
		
		if(file != null && !file.isEmpty()) {
			if(at.getChangeFileName() != null) {
				deleteFile(at.getChangeFileName(), request);
			}
			
			String renameFileName = saveFile(file, request);
			
			String savePath = savePath(file, renameFileName, request);
			
			if(renameFileName != null) {
				at.setOriginalFileName(file.getOriginalFilename());
				at.setChangeFileName(renameFileName);
				at.setFilePath(savePath);
			}
			
			result = nService.noticeUpdateFile(n, at);
			
		}  else {
			result = nService.noticeUpdate(n);
		 }
		
		if(result > 0) {
			mv.addObject("page", page)
			  .setViewName("redirect:nlist.do");
		} else {
			throw new NoticeException("공지사항 수정 실패");
		}
		
		return mv;
	}
	
	// 관리자 공지사항 게시글 삭제
	@RequestMapping("nDelete.do")
	public String noticeDelete(int nId, Attachment at, HttpServletRequest request) {
		
		Notice n = nService.selectaNotice(nId);
		
		if(at.getOriginalFileName() != null) {
			deleteFile(at.getChangeFileName(), request);
		}
		
		int result = nService.deleteNotice(nId);
		
		if(result > 0) {
			return "redirect:nlist.do";
		} else {
			throw new NoticeException("공지사항 삭제에 실패");
		}
		
	}
	
	
	// 관리자 공지사항 게시글 검색
	@RequestMapping("anSearch.do")
	public ModelAndView aNoticeSearch( ModelAndView mv, nSearch search,
			@RequestParam(value="page", required=false) Integer page) {

		//System.out.println(search);
		
		// 전체 게시글 수 리턴 받기
		int listCount = nService.searchListCount(search);
				
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
				
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Notice> noticeSearchList = nService.noticeSearchList(search, pi);
		
		if(noticeSearchList != null) {
			mv.addObject("nlist", noticeSearchList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("notice/adminNoticeListView");			
		} else {
			throw new NoticeException("고객센터 공지사항 게시글 목록 검색 실패");
		}
		
		return mv;
	}
	
	// 고객센터 공지사항 게시글 검색
	@RequestMapping("tnSearch.do")
	public ModelAndView tNoticeSearch( ModelAndView mv, nSearch search,
			@RequestParam(value="page", required=false) Integer page) {

		//System.out.println(search);
		
		// 전체 게시글 수 리턴 받기
		int listCount = nService.searchTnListCount(search);
				
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
				
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Notice> tnoticeSearchList = nService.tnoticeSearchList(search, pi);
		
		if(tnoticeSearchList != null) {
			mv.addObject("tnlist", tnoticeSearchList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("notice/totlaNoticeListView");			
		} else {
			throw new NoticeException("고객센터 공지사항 게시글 목록 검색 실패");
		}
		
		return mv;
	}
	
	// 매장회원 공지사항 게시글 검색
	@RequestMapping("snSearch.do")
	public ModelAndView sNoticeSearch( ModelAndView mv, nSearch search,
			@RequestParam(value="page", required=false) Integer page) {

		//System.out.println(search);
		
		// 전체 게시글 수 리턴 받기
		int listCount = nService.searchSnListCount(search);
				
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
				
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Notice> snoticeSearchList = nService.snoticeSearchList(search, pi);
		
		if(snoticeSearchList != null) {
			mv.addObject("snlist", snoticeSearchList);
			mv.addObject("search", search);
			mv.addObject("pi", pi);
			mv.setViewName("notice/storeNoticeListView");			
		} else {
			throw new NoticeException("고객센터 공지사항 게시글 목록 검색 실패");
		}
		
		return mv;
	}
	
	// 공지사항 파일 저장을 위한 별도의 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		//파일이 저장 될 경로 설정
		// 해당 resources는 webapp 하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\nUploadFiles";
		
		File folder = new File(savePath);// savePath 폴더를 불러와서
		if(!folder.exists())	// 사진을 저장하고자 하는 경로가 존재하지 않는다면
			folder.mkdirs();	// 포함 된 경로를 모두 생성함
		
		// 파일 Rename -> 현재 시간 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename(); // -> 원래 이름으로부터 확장자 추출
		String renameFileName = sdf.format(new Date())
				+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 파일 경로 구하기
	public String savePath(MultipartFile file, String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String path = root + "\\nUploadFiles";
		File folder = new File(path);
		
		String savePath = folder + "\\" + renameFileName;
		
		return savePath;
	}
	
	// 파일 삭제용 메소드
	public void deleteFile(String filePath, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);
		
		// 삭제할 파일을 메모리로 불러옴
		File deleteFile = new File(root + filePath);
		
		// 해당 경로에 해당 파일명을 가진 파일이 존재한다면
		if(deleteFile.exists()) {
			// 파일 삭제
			deleteFile.delete();
		}
		
		
	}
	

}
