package com.kh.ssakbaedal.event.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PageInfo;


public interface EventService {
		// 1. 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
		public int selectListCount();
		
		// 2. 게시글 조회(페이징 처리 된)
		public ArrayList<Event> selectList(PageInfo pi);
		
		// 3. 게시글 작성
		public int insertEvent(Event e);
		
		// 4. 게시글 상세보기(flag -> 조회수 증가 실행 여부)
		public Event selectEvent(int eNo, boolean flag);
		
		// 5. 게시글 수정
		public int updateEvent(Event b);
		
		// 6. 게시글 삭제
		public int deleteEvent(int eNo);

}
