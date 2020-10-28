package com.kh.ssakbaedal.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsController {

	@RequestMapping("statistics.do")
	public String goStatistics() {
		return "store/statistics/calendar";
	}
	
}
