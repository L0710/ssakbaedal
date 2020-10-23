package com.kh.ssakbaedal.serviceCenter.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.serviceCenter.model.dao.serviceCenterDao;
import com.kh.ssakbaedal.serviceCenter.model.vo.faq;

@Service("csService")
public class serviceCenterSerivceImpl implements serviceCenterService {
	@Autowired
	private serviceCenterDao scDao;
	
	//게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	@Override
	public int selectListCount() {
		return scDao.selectListCount();
	}
	
	// 게시글 조회(페이징 처리 된)
	@Override
	public ArrayList<faq> selectList(PageInfo pi) {
		return scDao.selectList(pi);
	}
	
	// FAQ 게시글 상세보기
	@Override
	public faq selectFaq(int fNo) {
		return scDao.selectFaq(fNo);
	}
	
	// FAQ 게시글 작성
	@Override
	public int FAQInsert(faq f) {
		return scDao.FAQInsert(f);
	}

	// FAQ 게시글 수정
	@Override
	public int FAQUpdate(faq f) {
		return scDao.FAQUpdate(f);
	}
	
	// FAQ 게시글 삭제
	@Override
	public int faqDelete(int fNo) {
		return scDao.faqDelete(fNo);
	}
	
	
	
}
