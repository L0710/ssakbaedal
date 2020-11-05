package com.kh.ssakbaedal.require.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.require.model.vo.Require;

@Repository("reDao")
public class RequireDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 일반회원 문의사항 게시글 갯수
	public int reListCount(int mNo) {
		return sqlSession.selectOne("requireMapper.reListCount", mNo);
	}
	
	// 일반회원 문의사항 게시글 조회
	public ArrayList<Require> selectReList(PageInfo pi, int mNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("requireMapper.selectReList", mNo, rowBounds);
	}
	// 일반회원 문의사항 게시글 상세보기
	public Require uReqSelect(int reNo) {
		return sqlSession.selectOne("requireMapper.uReqSelect", reNo);
	}
	
	// 일반회원 문의사항 게시글 상세보기(파일)
	public Attachment uReqSelectFile(int reNo) {
		return sqlSession.selectOne("requireMapper.uReqSelectFile", reNo);
	}
	
	// 일반회원 문의사항 게시글 작성(파일이 없는 경우도 포함)
	public int urequireInsert(Require re) {
		return sqlSession.insert("requireMapper.urequireInsert", re);
	}
	
	// 일반회원 문의사항 게시글 작성(파일)
	public int urequireInsertFile(Attachment at) {
		return sqlSession.insert("requireMapper.urequireInsertFile", at);
	}
	
	// 일반회원 문의사항 게시글 삭제
	public int uReqDelete(int reNo) {
		return sqlSession.update("requireMapper.uReqDelete", reNo);
	}
	
	// 일반회원 문의사항 게시글 수정
	public int ureqUpdate(Require re) {
		return sqlSession.update("requireMapper.ureqUpdate", re);
	}
	
	// 일반회원 문의사항 게시글 수정(파일)
	public int ureqUpdateFile(Attachment at) {
		return sqlSession.update("requireMapper.ureqUpdateFile", at);
	}
	
	// 관리자 문의사항 게시글 갯수
	public int aerqListCount() {
		return sqlSession.selectOne("requireMapper.aerqListCount");
	}
	
	// 관리자 문의사항 게시글 조회
	public ArrayList<Require> aSelectReList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("requireMapper.aSelectReList", null, rowBounds);
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력
	public Require aReqSelete(int reNo) {
		return sqlSession.selectOne("requireMapper.aReqSelete", reNo);
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력(파일)
	public Attachment aReqSelectFile(int reNo) {
		return sqlSession.selectOne("requireMapper.aReqSelectFile", reNo);
	}
	
	// 관리자 문의사항 게시글 답변 작성
	public int aReAnswerInsert(Reply r) {
		return sqlSession.insert("requireMapper.aReAnswerInsert", r);
	}
	
	// 관리자 문의사항 게시글 답변 작성 했을때 Require RE_ANSWER 'N' -> 'Y'로 변경
	public int aaReqUpdate(Require re) {
		return sqlSession.update("requireMapper.aReqUpdate", re);
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력(답변 출력)
	public Reply aReplyselect(int reNo) {
		return sqlSession.selectOne("requireMapper.aReplyselect", reNo);
	}
	
	// 관리자 문의사항 게시글 답변 수정 뷰 이동
	public Reply areqUpView(int rNo) {
		return sqlSession.selectOne("requireMapper.areqUpView", rNo);
	}
	
	// 관리자 문의사항 게시글 답변 수정
	public int aReaAnswerUpdate(Reply r) {
		return sqlSession.update("requireMapper.aReaAnswerUpdate", r);
	}
	
	// 관리자 문의사항 게시글 답변 삭제
	public int areqDelete(int reNo) {
		return sqlSession.update("requireMapper.areqDelete", reNo);
	}
	
	// 관리자 문의사항 게시글 답변 삭제
	public int aareqDelete(int reNo) {
		return sqlSession.update("requireMapper.aareqDelete", reNo);
	}
	
	


}
