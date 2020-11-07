package com.kh.ssakbaedal.event.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PointHistory;
import com.kh.ssakbaedal.event.model.vo.Search;
import com.kh.ssakbaedal.member.model.vo.Member;


public interface EventService {
		// 1. 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
		public int selectListCount();
		
		// 2. 게시글 조회(페이징 처리 된)
		public ArrayList<Event> selectList(PageInfo pi);
		
		// 3. 게시글 작성
		public int insertEvent(Event e);
		
		// 3_2. 게시글 이미지 있을 경우 
		public int insertEventNImg(Event e, Attachment at);
		
		// 4_1. 게시글 상세보기(flag -> 조회수 증가 실행 여부)
		public Event selectEvent(int eNo, boolean flag);
		
		// 4_2. 이미지 셀렉
		public Attachment selectImg(int eNo);
		
		// 5_1. 게시글 수정
		public int updateEvent(Event b);
		
		// 5_2. 이미지 수정
		public int updateEventNImg(Event e, Attachment at);
		
		// 6. 게시글 삭제
		public int deleteEvent(int eNo);

		// 7. 게시글 검색
		public ArrayList<Event> searchList(Search search, PageInfo pi);
		
		// 8. 포인트 추가
		public int pointUpdate(Member updateMember, Integer eNo);

		// 9. 포인트 지급 이력 검사
		public PointHistory pointHistory(PointHistory ph);
		
		// 10. 검색한 게시글 개수
		public int searchListCount(Search search);

		// 11. 댓글 리스트 조회
		public ArrayList<Reply> selectReplyList(int eNo);

		// 12. 댓글 등록
		public int insertReply(Reply r);

}
