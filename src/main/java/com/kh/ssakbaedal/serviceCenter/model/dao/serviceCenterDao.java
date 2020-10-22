package com.kh.ssakbaedal.serviceCenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.serviceCenter.model.vo.faq;

@Repository("scDao")
public class serviceCenterDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount() {
		return sqlSession.selectOne("FAQMapper.selectListCount");
	}
	
	// 게시글 조회(페이징 처리 된)
	public ArrayList<faq> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("FAQMapper.selectList", null, rowBounds);
	}
	
	// FAQ 게시글 상세보기
	public faq selectFaq(int fNo) {
		return sqlSession.selectOne("FAQMapper.selectFaq", fNo);
	}
	
	// FAQ 게시글 작성
	public int FAQInsert(faq f) {
		return sqlSession.insert("FAQMapper.FAQInsert", f);
	}
	
	// FAQ 게시글 수정
	public int FAQUpdate(faq f) {
		return sqlSession.update("FAQMapper.FAQUpdate", f);
	}
	
	// FAQ 게시글 삭제
	public int faqDelete(int fNo) {
		return sqlSession.update("FAQMapper.faqDelete", fNo);
	}

}
