package com.kh.ssakbaedal.kakao.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ssakbaedal.kakao.Kakao_restapi;

@Controller
@RequestMapping("/kakao")
public class kakaoController {
 private Kakao_restapi kakao_restapi=new Kakao_restapi();
 
 @RequestMapping(value="/oauth",method= RequestMethod.GET)
 public String kakaoConnect() {

  StringBuffer url = new StringBuffer();
  url.append("https://kauth.kakao.com/oauth/authorize?");
  url.append("client_id=" + "자기의 client id를 넣어줍니다");
  url.append("&redirect_uri=http://localhost:8080/mytest04/kakao/callback"); //-> 이건 저의 경우의 redirect url이고요
  url.append("&response_type=code");

  return "redirect:" + url.toString();
 }
 
 @RequestMapping(value="/callback",produces="application/json",method= {RequestMethod.GET, RequestMethod.POST})
 public String kakaoLogin(@RequestParam("code")String code,RedirectAttributes ra,HttpSession session,HttpServletResponse response )throws IOException {
  
  
  System.out.println("kakao code:"+code);// ->여기서 코드를 콘솔에 받아와서 띄워줄 것입니다.

  return "home";
 }

}