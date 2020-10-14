package com.kh.ssakbaedal.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.event.model.exception.EventException;
import com.kh.ssakbaedal.event.model.service.EventService;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PageInfo;
import com.kh.ssakbaedal.event.model.vo.Pagination;

@Controller
public class EventController {

	@Autowired
	private EventService eService;
	
	@RequestMapping("elist.do")
	public ModelAndView eventList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 1. 전체 게시글 수 리턴 받기
		int listCount = eService.selectListCount();
//		System.out.println("lCount : " + listCount);
		
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
		
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10 , 10);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Event> list = eService.selectList(pi);
		
//		System.out.println("list : " + list);
//		System.out.println("pi : " + pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("event/eventListView");
		} else {
			throw new EventException("이벤트 목록 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("einsertView.do")
	public String boardInsertView() {
		return "event/eventInsertForm";
	}
	
	@RequestMapping("einsert.do")
	public String boardInsert(Event e, HttpServletRequest request, Attachment at,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		int result = 0;
		
		// 파일이 업로드 되었다면 (업로드 된 파일명이 ""가 아니라면)
		if(!file.getOriginalFilename().equals("")) {
			// 파일명 리네임 후 지정 경로에 파일을 저장하는 별도 메소드를 통해 저장
			String renameFileName = saveFile(file, request);
			
			String savePath = savePath(file, renameFileName, request);
			// 파일 저장이 잘 되었다면 DB로 보낼 Board에 파일명 관련 컬럼을 채워줌
			if(renameFileName != null) {
				at.setOriginalFileName(file.getOriginalFilename());
				at.setChangeFileName(renameFileName);
				at.setFilePath(savePath);
			}
			result = eService.insertEventNImg(e, at);
		} else {
			result = eService.insertEvent(e);
		}
//		System.out.println("at-o:"+at.getOriginalFileName());
//		System.out.println("at-c:"+at.getChangeFileName());
		
		if(result > 0) {
			return "redirect:elist.do";
		} else {
			throw new EventException("이벤트 등록에 실패하였습니다.");
		}
	}
	
	// 파일 저장을 위한 별도의 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장 될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\euploadFiles";
		
		File folder = new File(savePath);
		
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
		
		String path = root + "\\euploadFiles";
		File folder = new File(path);
		
		String savePath = folder + "\\" + renameFileName;
		
//		System.out.println("savePath:"+savePath);
		
		return savePath;
	}
	
	@RequestMapping("edetail.do")
	public ModelAndView EventDetail(ModelAndView mv, 
									int eNo, @RequestParam("page") Integer page,
									HttpServletRequest request,
									HttpServletResponse response) {
		
		int currentPage = page != null ? page : 1;
		
		// 쿠키 값을 이용하여 게시글 읽음 여부 확인 => 조회수 증가 여부 표현
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("eNo"+eNo)) {
					// 해당 게시글에 대한 쿠키 존재(이미 게시글을 읽었음)
					flag = true;
				}
			}
			if(!flag) {	// 게시글을 처음 읽은 경우 쿠키 저장하기
				Cookie c = new Cookie("eNo"+eNo, String.valueOf(eNo));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루 동안 저장
				response.addCookie(c);
			}
		}
		
		Event event = eService.selectEvent(eNo, flag);
		Attachment at = eService.selectImg(eNo);
		
		if(event != null) {
			mv.addObject("e", event)
			  .addObject("currentPage", currentPage)
			  .addObject("at", at)
			  .setViewName("event/eventDetailView");
		} else {
			throw new EventException("게시글 상세조회에 실패하였습니다.");
		}
		
		return mv;
	}
}
