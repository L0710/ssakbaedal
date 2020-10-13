package com.kh.ssakbaedal.event.controller;

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
	public String boardInsert(Event e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		// 파일이 업로드 되었다면 (업로드 된 파일명이 ""가 아니라면)
		if(!file.getOriginalFilename().equals("")) {
			// 파일명 리네임 후 지정 경로에 파일을 저장하는 별도 메소드를 통해 저장
			String renameFileName = saveFile(file, request);
			
			/*// 파일 저장이 잘 되었다면 DB로 보낼 Board에 파일명 관련 컬럼을 채워줌
			if(renameFileName != null) {
				e.setOriginalFileName(file.getOriginalFilename());
				e.setRenameFileName(renameFileName);
			}*/
		}
		
		int result = eService.insertEvent(e);
		
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
}
