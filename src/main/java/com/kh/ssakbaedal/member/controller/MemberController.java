package com.kh.ssakbaedal.member.controller;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ssakbaedal.member.model.exception.MemberException;
import com.kh.ssakbaedal.member.model.service.MemberService;
import com.kh.ssakbaedal.member.model.vo.Member;
 

@SessionAttributes({"loginUser", "msg"})
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
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
	 
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
//		System.out.println(m);
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {

//			logger.info(loginUser.getmType() + " 타입");
			model.addAttribute("loginUser", loginUser);
			if(loginUser.getmType().equals("1")) {
				return "redirect:home.do";
			}else if(loginUser.getmType().equals("3")){
				return "store/management/openSettingView";
			}else {
				return "redirect:home.do";
			}
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}

		
	}

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, RedirectAttributes rd,
								String phone1,String phone2,String phone3) {
		m.setmPhone(phone1 + phone2 + phone3);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:login.do";
			
		} else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}
		
	}
	
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
	@RequestMapping(value = "checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(Member m) {
//System.out.println(m);
		int result = mService.checkId(m);

		if(result > 0) {
			return "No";
			
		} else {
			return "Yes";
		}
	}
	
	@RequestMapping("pointView.do")
	public String pointView(){
		return "member/pointView";
	}
	
	@RequestMapping("mypage_admin.do")
	public String adminMypageView() {
		
		logger.debug("관리자 마이 페이지로 이동합니다");
		
		return "report/reportList";
	}
	
	@RequestMapping("mypage_store.do")
	public String storeMypageView() {
		
		logger.debug("점포 마이 페이지로 이동합니다");
		
		return "store/order/storeOrderView";
	}

	
}
