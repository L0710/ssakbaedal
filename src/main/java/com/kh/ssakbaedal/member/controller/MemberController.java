package com.kh.ssakbaedal.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileInfo;
import com.kh.ssakbaedal.common.attachment.FileList;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.mail.model.service.MailService;
import com.kh.ssakbaedal.mail.model.vo.Mail;
import com.kh.ssakbaedal.member.model.exception.MemberException;
import com.kh.ssakbaedal.member.model.service.MemberService;
import com.kh.ssakbaedal.member.model.vo.Cal;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.exception.ManagementException;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.MenuList;
import com.kh.ssakbaedal.store.model.vo.Store;


@SessionAttributes({ "loginUser", "msg" })
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private MailService mailService;

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("login.do")
	public String loginView() {

		logger.debug("로그인 페이지로 이동합니다");

		return "member/login";
	}

	@RequestMapping("findId.do")
	public String findId() {

		logger.debug("아이디 찾기로 이동합니다");

		return "member/findId";
	}

	@RequestMapping("findPwd.do")
	public String findPwdView() {

		logger.debug("비밀번호 찾기로 이동합니다");

		return "member/findPwd";
	}
	@RequestMapping("snsSignUp.do")
	public String snsSignUp() {

		logger.debug("SNS 회원가입/로그인 페이지로 이동합니다");

		return "member/snsSignUp";
	}

	@RequestMapping("signUp.do")
	public String signUpView() {

		logger.debug("회원 가입 페이지로 이동합니다");

		return "member/signUp";
	}

	@RequestMapping("mSignUp.do")
	public String mSignUpView() {

		logger.debug("일반회원 가입 페이지로 이동합니다");

		return "member/mSignUp";
	}

	@RequestMapping("sSignUp.do")
	public String sSignUpView() {

		logger.debug("매장회원 가입 페이지로 이동합니다");

		return "member/sSignUp";
	}

	@RequestMapping("myInfo.do")
	public String myInfoView() {
		
		logger.debug("내정보로 이동합니다");
		
		return "member/myInfo";
	} 
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	   public String memberLogin(Member m, Model model,RedirectAttributes rd) {
	      
	      Member loginUser = mService.loginMember(m);
	      
	      if(loginUser != null) {
	         model.addAttribute("loginUser", loginUser);
	         return "redirect:home.do";
	      }else {
	    	  rd.addFlashAttribute("msg", "로그인을 실패하였습니다. 다시 시도해주세요");
		      return "redirect:login.do";
	      }
	   }

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();

		return "redirect:home.do";
	}

	// 중복확인
	@RequestMapping(value = "checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(Member m) {

		int result = mService.checkId(m);

		if (result > 0) {
			return "No";

		} else {
			return "Yes";
		}
	}
	
	@RequestMapping("mdelete.do")
	public String memberDelete( String id, 
								SessionStatus status,
								RedirectAttributes rd) {
		
		int result = mService.deleteMember(id); 
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원 탈퇴가 완료 되었습니다.");
			status.setComplete(); // 세션에서도 loginUser 제거
		}else {
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
		return "redirect:home.do";
	}
	
	
	
	
	

	// 일반회원 회원가입
	@RequestMapping("mInsert.do")
	public String memberInsert(Member m, RedirectAttributes rd) {

		int result = mService.insertMember(m);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:login.do";
		} else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}

	}
	

	// 매장회원 회원가입
	@RequestMapping("sInsert.do")
	public String storeInsert(Member m, Store s,MultipartHttpServletRequest request,
			@RequestParam("post") String post,@RequestParam("address1") String address1,@RequestParam("address2") String address2,
			@RequestParam(value="bFile")MultipartFile bfile,@RequestParam(value="sFile")MultipartFile sfile,
			@RequestParam(value="mnFile" ,required=false) MultipartFile[] mnFile,@ModelAttribute MenuList menuList,RedirectAttributes rd) {
		
		s.setsAddress(post + "," + address1 + "," + address2);
		
		System.out.println(m);
		System.out.println(s);
		
		FileInfo bfileInfo = saveFile("6",bfile,request);
		Attachment bf = new Attachment();
		bf.setOriginalFileName(bfile.getOriginalFilename());
		bf.setChangeFileName(bfileInfo.getRenameFileName());
		bf.setFilePath(bfileInfo.getRenamePath());

		FileInfo sfileInfo = saveFile("8",sfile,request);	
		Attachment sf = new Attachment();
		sf.setOriginalFileName(sfile.getOriginalFilename());
		sf.setChangeFileName(sfileInfo.getRenameFileName());
		sf.setFilePath(sfileInfo.getRenamePath());
		
		ArrayList<Attachment> files = new ArrayList<Attachment>();
		 for(int i=0;i<mnFile.length;i++) {
			 	MultipartFile f = mnFile[i];
			 	
			 	FileInfo filesInfo = saveFile("5",f,request);
				Attachment newMnFile = new Attachment();
				newMnFile.setOriginalFileName(f.getOriginalFilename());
				newMnFile.setChangeFileName(filesInfo.getRenameFileName());
				newMnFile.setFilePath(filesInfo.getRenamePath());
				
				files.add(newMnFile);
		 }

		int result = mService.insertStore(m,s,bf,sf,files,menuList);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:login.do";

		} else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}

	}

	//파일 이름 변경
	public FileInfo saveFile(String type,MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources/muploadFiles");
		
		String savePath = new String();
		
		if(type=="6") {
			savePath = root + "\\certification";
		}else if(type=="8") {
			savePath = root + "\\logo";
		}else {
			savePath = root + "\\menu";
		}

		File folder = new File(savePath);

		if (!folder.exists())
			folder.mkdirs();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + (int) (Math.random() * 100000)
				+ originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
	
		FileInfo fileInfo = new FileInfo(renamePath, renameFileName);

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}		
		return fileInfo;
	}
	
	//메뉴 추가
	@RequestMapping("menuInsert.do")
	public String menuInsert( Menu m, HttpSession session,
			@RequestParam(value="mupFile", required=false) MultipartFile mupFile,
			HttpServletRequest request) {
					
		
					Member mem = (Member)session.getAttribute("loginUser");
					int mNo = mem.getmNo();
					m.setmNo(mNo);
					
					int result2 = mService.insertMenu(m);
					
					if(result2 > 0) {
						FileInfo fmenu = saveFile("5",mupFile,request);	
						
						Attachment attach = new Attachment();
						attach.setaType(5);
						attach.setOriginalFileName(mupFile.getOriginalFilename());
						attach.setChangeFileName(fmenu.getRenameFileName());
						attach.setFilePath(fmenu.getRenamePath());
						
						int result1 = mService.insertMenuImg(attach, m);
						ArrayList<Menu> menu = mService.selectMenu(mNo); 
						
						if(result1 <= 0) {
							throw new MemberException("메뉴추가에 실패했습니다.");
						} 
					}
					
		return "redirect:menuSetting.do";
	}
	
	//메뉴 수정
	@RequestMapping("menuUpdate.do")
	public String deleteMenu( HttpServletRequest request , String[] refId,
			@RequestParam(value="menuUpFile", required=false) MultipartFile[] menuUpFile,
			@ModelAttribute MenuList menuList) {
		
		ArrayList<Attachment> files = new ArrayList<Attachment>();
		 for(int i=0;i<menuUpFile.length;i++) {
			 	MultipartFile file = menuUpFile[i];

			 	if(file.getOriginalFilename() != "") {
/*			 		if(attach.getChangeFileName() != null) {
			 			deleteFile("5",attach.getChangeFileName(), request);	
			 		}*/
			 		
			 		FileInfo filesInfo = saveFile("5",file,request);
					Attachment newMnFile = new Attachment();
					newMnFile.setOriginalFileName(file.getOriginalFilename());
					newMnFile.setChangeFileName(filesInfo.getRenameFileName());
					newMnFile.setFilePath(filesInfo.getRenamePath());
					newMnFile.setRefId(Integer.parseInt(refId[i]));
					files.add(newMnFile);		 
				 	
			 	}
		 }
		 
		 int result = mService.updateMenu(files, menuList);
		
		return "redirect:menuSetting.do";
	}
	
	
	// 파일 삭제용 메소드
		public void deleteFile(String type,String fileName, HttpServletRequest request) {
			
			String root = request.getSession().getServletContext().getRealPath("resources/muploadFiles");
			
			String savePath = new String();
			
			if(type=="6") {
				savePath = root + "\\certification";
			}else if(type=="8") {
				savePath = root + "\\logo";
			}else {
				savePath = root + "\\menu";
			}
			
			// 삭제할 파일을 메모리로 불러옴
			File deleteFile = new File(savePath + "\\" + fileName);
			System.out.println(deleteFile);

			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
	
	//매장정보 수정뷰
	@RequestMapping("storeManage.do")
	public ModelAndView storeInfo(ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
		System.out.println(mNo);
		
		Store s = mService.selectStore(mNo);
		Attachment attach = mService.selectmImg(mNo); 
		
		if(s != null && attach != null) {
			mv.addObject("s", s);
			mv.addObject("attach", attach);
			
			mv.setViewName("store/management/storeInfoView");
		} else {
			throw new MemberException("매장 정보 페이지 조회 실패");
		}
		
		return mv;
	}
	
	
	//매장 정보 update
	@RequestMapping("updateInfo.do")
	public String updatesInfo(ModelAndView mv, Store s, Attachment attach, 
															    HttpServletRequest request,
															    @RequestParam(value="uploadLogoFile", required=false) MultipartFile file,
															    @RequestParam("post") String post,@RequestParam("address1") String address1,@RequestParam("address2") String address2,
															    @RequestParam("sOpen1")String open1, @RequestParam("sOpen2")String open2, @RequestParam("sOpen3")String open3,
															    @RequestParam("sOff")String sOff, 
															    @RequestParam("week")String week, @RequestParam("date")String date,
															    @RequestParam("cateinpt") String sCate) {
		
		s.setOpenTime(open1+","+open2+","+open3);
		s.setsAddress(post + "," + address1 + "," + address2);
		s.setsCategory(sCate);
		
		int mNo = s.getmNo();
		attach.setRefId(mNo);
		
		
		if(sOff.equals("정기휴무")) {
			s.setsOff(sOff+","+week+","+date);
			System.out.println(s.getsOff());
		} else {
			s.setsOff(sOff);
		}
		
		//로고 수정 했을 때
		if(file != null && !file.isEmpty()) {
			
			FileInfo logoInfo = saveFile("8",file,request);	
			
			attach.setOriginalFileName(file.getOriginalFilename());
			attach.setChangeFileName(logoInfo.getRenameFileName());
			attach.setFilePath(logoInfo.getRenamePath());
			
			int result1 = mService.updateLogo(attach);
			
			if(result1 > 0 ) {
				System.out.println("성공");
	/*			mv.addObject("attach", attach);
				mv.setViewName("store/management/storeInfoView");*/
			} else {
				throw new MemberException("매장로고 수정 실패");
			}
			
		} else {  
			//로고 수정 안했을 때
			int result2 = mService.updateStore(s);
			Attachment at = mService.selectmImg(mNo);
			if(result2 > 0 && at != null) {
				System.out.println("성공");
/*				mv.addObject("s", s);
				mv.addObject("attach", at);
				mv.setViewName("store/management/storeInfoView");*/
			} else {
				throw new MemberException("매장정보 수정 실패");
			}
			
		}
		
	

		return "redirect:storeManage.do";
	}

	
	//메뉴삭제
		@RequestMapping("deleteMenu.do")
		public ModelAndView deleteMenu(ModelAndView mv, String mnno, HttpSession session,HttpServletRequest request) {
			
			Member m = (Member)session.getAttribute("loginUser");
			int mNo = m.getmNo();
			int mnNo = Integer.parseInt(mnno);
			System.out.println("메뉴번호 : " + mnNo);
			
			Attachment attach = mService.selectOne(mnNo);
			int result = mService.deleteSale(mnNo);
		
			
			if(result > 0 && attach != null) {
				deleteFile("5",attach.getChangeFileName(), request);
			} else {
				throw new ManagementException("메뉴 삭제 실패");
			}
			
			ArrayList<Menu> menu = mService.selectMenu(mNo);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			mv.addObject("menu", menu);
			mv.addObject(gson.toJson(menu));
			mv.setViewName("store/management/menuSettingView");
			
			return mv;
		}
	
/*	public String savePath(MultipartFile file, String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String path = root + "\\muploadFiles";
		File folder = new File(path);
		
		String savePath = folder + "\\" + renameFileName;
		
		
		return savePath;
	}
*/
	
	@RequestMapping("mupdate.do")
	public String mupdate(Member m,Model model, RedirectAttributes rd) {
		System.out.println(m);
		Member loginUser = mService.mupdate(m);
		
	      if(loginUser != null) {
		         model.addAttribute("loginUser", loginUser);
		      }else {
		         throw new MemberException(".");
		      }
		      return "redirect:myInfo.do";
		   }
	
	//아이디 찾기
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	@ResponseBody
	public String findId(Member m) {

		Member findId = mService.findId(m);

		if (findId != null) {
			return findId.getmId();
		} else {
			return "null";
		}
	}

	// 비밀번호 찾기
	@RequestMapping(value = "findPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String findPwd(Member m) throws Exception {

		Member findPwd = mService.findPwd(m);

		if (findPwd != null) {

			String tmp = "";

			for (int i = 0; i < 9; i++) {
				int div = (int) Math.floor(Math.random() * 2);
				if (div == 0) {
					tmp += (char) (Math.random() * 10 + '0');
				} else {
					tmp += (char) (Math.random() * 26 + 65);
				}
			}

			findPwd.setmPwd(tmp);

			Mail mail = new Mail();
			mail.setMailFrom("abc7846www@naver.com");
			mail.setMailTo(findPwd.getmEmail());
			mail.setMailSubject("[싹배달]임시비밀번호가 도착하였습니다.");
			mail.setMailContent(findPwd.getmId() + " 님의 임시 비밀번호는" + tmp + "입니다. 로그인 후 비밀번호를 변경해주세요.");

			mailService.sendEmail(mail);

			int result = mService.updatePwd(findPwd);

			return "yes";
		} else {
			return "null";
		}
	}


	// 포인트뷰
	@RequestMapping("pointView.do")
	public ModelAndView point(HttpSession session, ModelAndView mv) {

		Member member = (Member)session.getAttribute("loginUser");
		int mNo = member.getmNo();
		String grade = member.getmGrade();
		int goal = 0;
		if(grade.equals("BRONZE")) {
			goal = 500000;
		} else if(grade.equals("SILVER")) {
			goal = 1000000;
		} else {
			goal = 10000000;
		}
		
		int priceSum = mService.selectPriceSum(mNo);
		Cal cal = new Cal();
		cal.setPriceSum(priceSum);
		int difference = goal-priceSum;
		cal.setDifference(difference);
		
		mv.addObject("cal",cal);
		mv.setViewName("member/pointView");
		
		return mv;

	}

	@RequestMapping("mypage_store.do")
	public String storeMypageView() {

		logger.debug("점포 마이 페이지로 이동합니다");

		return "store/order/storeOrderView";
	}

	@RequestMapping("memlist.do")
	public ModelAndView memberList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		// 1. 전체 게시글 수 리턴 받기
		int listCount = mService.selectmemListCount();
//		System.out.println("lCount : " + listCount);

		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;

		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);

		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Member> list = mService.selectmemList(pi);

//		System.out.println("list : " + list);
//		System.out.println("pi : " + pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/memberListView");
		} else {
			throw new MemberException("이벤트 목록 조회에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("memupdate.do")
	public String statusUpdate(HttpServletRequest request, Model model, RedirectAttributes rd) {

		String[] Array = request.getParameterValues("mNo");

		String[] mNoArr = Array[0].split(",");

		int[] num = new int[mNoArr.length];

		for (int i = 0; i < mNoArr.length; i++) {
			if (!mNoArr[i].equals("")) {
//				System.out.println(mNoArr[i]);
				num[i] = Integer.parseInt(mNoArr[i]);
			}
		}

		int result = mService.updateStatus(num);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원 변경 사항이 성공적으로 반영 되었습니다.");
		} else {
			throw new MemberException("회원 변경 사항 수정에 실패하였습니다.");
		}
		return "redirect:memlist.do";
	}

//	@Scheduled(cron="0 * * * * *") // 매분 0초마다 동작
	@Scheduled(cron = "0 0 0 * * ?") // 매일 00시마다 동작
	public void releaseMember() {
		
		ArrayList<Member> list = mService.selectBannedList();
		
		int result = 0;
		
		for(int i=0; i<list.size(); i++) {
			int mNo = list.get(i).getmNo();
			result = mService.releaseMember(mNo);
		}
		
		if(result > 0) {
			logger.debug("멤버 밴 해제");
		}

	}
	

	@RequestMapping("memdetail.do")
	public ModelAndView memberList(ModelAndView mv, int mNo) {

		Member mem = mService.selectMemberInfo(mNo);
//		System.out.println("mem:"+mem);
		
		if(mem != null) {
			mv.addObject("mem",mem);
			mv.setViewName("member/memberDetail");
		}
		return mv;
	}
}
