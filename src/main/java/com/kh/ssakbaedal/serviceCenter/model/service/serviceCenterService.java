package com.kh.ssakbaedal.serviceCenter.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.serviceCenter.model.vo.faq;

public interface serviceCenterService {
	// FAQ 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount();
	
	// FAQ 게시글 조회(페이징 처리 된)
	public ArrayList<faq> selectList(PageInfo pi);
	
	// FAQ 게시글 상세보기
	public faq selectFaq(int fNo);
	
	// FAQ 게시글 작성
	public int FAQInsert(faq f);

	// FAQ 게시글 수정
	public int FAQUpdate(faq f);
	
	// FAQ 게시글 삭제
	public int faqDelete(int fNo);
	

}
