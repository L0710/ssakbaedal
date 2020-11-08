package com.kh.ssakbaedal.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.event.model.exception.EventException;
import com.kh.ssakbaedal.event.model.service.EventService;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PointHistory;
import com.kh.ssakbaedal.event.model.vo.Search;
import com.kh.ssakbaedal.member.model.vo.Member;

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
	public String eventInsertView() {
		return "event/eventInsertForm";
	}
	
	@RequestMapping("einsert.do")
	public String eventInsert(Event e, HttpServletRequest request, Attachment at,
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
	public ModelAndView eventDetail(ModelAndView mv, 
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
	
	@RequestMapping("eupview.do")
	public ModelAndView eventUpdateView(ModelAndView mv, int eNo,
										@RequestParam("page") Integer page) {
		Event event = eService.selectEvent(eNo, true);
		Attachment at = eService.selectImg(eNo);
		
		mv.addObject("e", event)
		  .addObject("at", at)
		  .addObject("currentPage", page)
		  .setViewName("event/eventUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("eupdate.do")
	public ModelAndView eventUpdate(ModelAndView mv, Event e, Attachment at,
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
			
			result = eService.updateEventNImg(e, at);
		} else {
			result = eService.updateEvent(e); 
		}
		
		if(result > 0) {
			mv.addObject("page", page)
			   .setViewName("redirect:elist.do");
		}else {
			throw new EventException("이벤트 수정에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\euploadFiles"; 
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) 
			f.delete();
	}
	
	@RequestMapping("edelete.do")
	public String eventDelete(int eNo, Attachment at, HttpServletRequest request) {
		Event e = eService.selectEvent(eNo, false);
		
		if(at.getOriginalFileName() != null) {
			deleteFile(at.getChangeFileName(), request);
		}
		
		int result = eService.deleteEvent(eNo);
		
		if(result > 0) {
			return "redirect:elist.do";
		}else {
			throw new EventException("이벤트 삭제에 실패하였습니다");
		}
	}
	
	@RequestMapping("esearch.do")
	public String eventSearch(Search search, Model model, HttpSession session,
	         	@RequestParam(value="page", required=false) Integer page) {
		
		/*System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());*/
		
		// 페이징 
	    int listCount = eService.searchListCount(search); // 검색한 전체 글 수
//	    System.out.println("lCount:"+listCount);
	    
	    int currentPage = page != null ? page : 1; // 현재 페이지 계산
	            
	    PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10); // 페이지 

		ArrayList<Event> searchList = eService.searchList(search, pi);
		
//		System.out.println("slist:"+searchList);
		
		model.addAttribute("list", searchList);
		model.addAttribute("pi", pi);
		model.addAttribute("search", search);
		
		return "event/eventListView";
//	    return "";
	}
	
	@RequestMapping("pupdate.do")
	public String pointUpdate(Model model, RedirectAttributes rd, HttpServletRequest request,
								HttpServletResponse response, @RequestParam("eNo") Integer eNo,
								@RequestParam("ePoint") Integer ePoint, @RequestParam("mNo") Integer mNo) {
		Member updateMember = new Member();
		updateMember.setmNo(mNo);
		updateMember.setPoint(ePoint);
		
		int result = eService.pointUpdate(updateMember, eNo);
		
		if(result > 0) {
			model.addAttribute("loginUser", updateMember);
			rd.addFlashAttribute("msg", "포인트를 받았습니다.");
		}else {
			throw new EventException("포인트 추가에 실패하였습니다.");
		}
		
		return "redirect:elist.do";
	}
	
	@RequestMapping("selectphsty.do")
	@ResponseBody
	public String pointHistory(int eNo, int mNo) {
		PointHistory ph = new PointHistory();
		ph.seteNo(eNo);
		ph.setmNo(mNo);
		
		PointHistory phis = eService.pointHistory(ph);
//		System.out.println("phis:"+phis);
		
		if(phis != null) {	// 포인트 지급 내역 존재
			return "matched";
		} else {	// 포인트 지급내역 부재
			return "not matched";
		}
		
	}
	
	@RequestMapping("rList.do")
	@ResponseBody
	public String getReplyList(int eNo) {
		ArrayList<Reply> rList = eService.selectReplyList(eNo);
		// 2020-09-23
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		// 시분초 표시하고 싶다면 java.util.Date 사용할 것
		return gson.toJson(rList);
	}
	
	@RequestMapping("addReply.do")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
//		System.out.println("r:"+r);	
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getmId();
		
		r.setrWriter(rWriter);
		
		int result = eService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			throw new EventException("댓글 등록 실패");
		}
//		return "";
	}
}
