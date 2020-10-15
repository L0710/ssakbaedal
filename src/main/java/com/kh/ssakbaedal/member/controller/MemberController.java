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
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {

			logger.info(loginUser.getmType() + " 타입");
			model.addAttribute("loginUser", loginUser);
			if(loginUser.getmType().equals("1")) {
				return "redirect:mSignUp.do";
			}else if(loginUser.getmType().equals("3")){
				return "redirect:sSignUp.do";
			}else {
				return "redirect:mSignUp.do";
			}
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}

		
	}

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:login.do";
	}
	
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, RedirectAttributes rd,
								String phone1,String phone2,String phone3) {
		m.setmPhone(phone1 + phone2 + phone3);
 
		int result = mService.insertMember(m);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원가입을 축하합니다. 로그인 해주세요.");
			return "redirect:login.do";
			
		} else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}
		
	}
	
	
	
	
	
}
