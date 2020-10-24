package com.kh.ssakbaedal.member.controller;
 
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.member.model.exception.MemberException;
import com.kh.ssakbaedal.member.model.service.MemberService;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.vo.MenuList;
import com.kh.ssakbaedal.store.model.vo.Store;
 

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
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {

			return "redirect:home.do";
		}else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:login.do";
	}
	
	@RequestMapping("mInsert.do")
	public String memberInsert(Member m, RedirectAttributes rd) {

		int result = mService.insertMember(m);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료 되었습니다. 로그인 해주세요.");
			return "redirect:login.do";
			
		} else {
			throw new MemberException("회원 가입에 실패하였습니다.");
		}
		
	}
	@RequestMapping("sInsert.do")
	public String storeInsert(Member m, Store s,MultipartHttpServletRequest request,
			@RequestParam(value="bfile")MultipartFile bfile,@RequestParam(value="sfile")MultipartFile sfile,
			@RequestParam(value="mnFile") MultipartFile[] mnFile,@ModelAttribute MenuList menuList,RedirectAttributes rd) {
		
		String renamebFileName = saveFile(bfile,request);
		Attachment bf = new Attachment();
		bf.setOriginalFileName(bfile.getOriginalFilename());
		bf.setChangeFileName(renamebFileName);

		String renamesFileName = saveFile(sfile,request);	
		Attachment sf = new Attachment();
		sf.setOriginalFileName(sfile.getOriginalFilename());
		sf.setChangeFileName(renamesFileName);
		
		ArrayList<Attachment> files = new ArrayList<Attachment>();
		 for(int i=0;i<mnFile.length;i++) {
			 	MultipartFile f = mnFile[i];
			 	
				String ChangeFileName = saveFile(f,request);
				Attachment newMnFile = new Attachment();
				newMnFile.setOriginalFileName(f.getOriginalFilename());
				newMnFile.setChangeFileName(ChangeFileName);
				
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
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("변경에 들어온것"+file);
		String savePath = root + "\\file";
		
		File folder = new File(savePath);
		
		if(!folder.exists())	
			folder.mkdirs();	
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + (int)(Math.random()*100000)
				+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
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
		
		int result = mService.checkId(m);

		if(result > 0) {
			return "No";
			
		} else {
			return "Yes";
		}
	}
	
	
}
