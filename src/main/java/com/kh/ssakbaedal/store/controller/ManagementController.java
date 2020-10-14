package com.kh.ssakbaedal.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ssakbaedal.store.model.vo.Store;

@Controller
public class ManagementController {
	
	@RequestMapping("updateInfo.do")
	public String sInfoUpdate(Store s, String post, String address1, String address2, 
													 RedirectAttributes rd, Model model) {
		
		s.setsAddress(post + "," +address1+","+address2);
		
		
		
		return "redirect:home.do";
		
	}

}
