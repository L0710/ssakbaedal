package com.kh.ssakbaedal.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.service.ChartService;
import com.kh.ssakbaedal.store.model.vo.ChartSum;
import com.kh.ssakbaedal.store.model.vo.MenuChart;

@Controller
public class ChartController {

	@Autowired
	private ChartService cService;

	//차트 select
	@RequestMapping("chart.do")
	@ResponseBody
	public String goStatistics( HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
		
		Gson gson = new Gson();
		
		List<ChartSum> list = cService.selectChart(mNo);
		
		return gson.toJson(list);
	}
	
	//월별차트페이지로 이동	
	@RequestMapping("statistics.do")
	public String selectChart() {
		

		
		return "store/statistics/chart";
	}
	
	//메뉴별차트페이지로 이동	
	@RequestMapping("menuStatistics.do")
	public String selectMenuChart() {
		

		
		return "store/statistics/menuChart";
	}
	
	//메뉴차트 select
	@RequestMapping("menuChart.do")
	@ResponseBody
	public String goMenuChart( HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int mNo = m.getmNo();
		
		Gson gson = new Gson();
		
		List<MenuChart> list = cService.selectMenuChart(mNo);
		System.out.println(list);
		
		return gson.toJson(list);
	}
	
	
	
	
	
	
	
}
