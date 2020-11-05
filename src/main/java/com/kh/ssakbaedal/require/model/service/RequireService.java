package com.kh.ssakbaedal.require.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.require.model.vo.Require;

public interface RequireService {
	
	// 일반회원 문의사항 게시글 갯수 
	public int reListCount(int mNo);
	
	// 일반회원 문의사항 게시글 조회
	public ArrayList<Require> selectReList(PageInfo pi, int mNo);
	
	// 일반회원 문의사항 상세보기
	public Require uReqSelect(int reNo);
	
	// 일반회원 문의사항 상세보기(파일)
	public Attachment uReqSelectFile(int reNo);
	
	// 일반회원 문의사항 게시글 작성(파일)
	public int urequireInsertFile(Require re, Attachment at);
	
	// 일반회원 문의사항 게시글 작성
	public int urequireInsert(Require re);
	
	// 일반회원 문의사항 게시글 삭제
	public int uReqDelete(int reNo);
	
	// 일반회원 문의사항 게시글 수정(파일)
	public int ureqUpdateFile(Require re, Attachment at);
	
	// 일반회원 문의사항 게시글 수정
	public int ureqUpdate(Require re);
	
	// 관리자 문의사항 게시글 갯수
	public int aerqListCount();
	
	// 관리자 문의사항 게시글 조회
	public ArrayList<Require> aSelectReList(PageInfo pi);
	
	// 관리자 문의사항 게시글 디테일 뷰 출력
	public Require aReqSelete(int reNo);
	
	// 관리자 문의사항 게시글 디테일 뷰 출력(파일)
	public Attachment aReqSelectFile(int reNo);
	
	// 관리자 문의사항 게시글 답변작성
	public int aReaAnswerInsert(Reply r, Require re);
	
	// 관리자 문의사항 게시글 디테일 뷰 출력(답변 출력)
	public Reply aReplyselect(int reNo);
	
	// 관리자 문의사항 게시글 답변 수정 뷰 이동
	public Reply areqUpView(int rNo);
	
	// 관리자 문의사항 게시글 답변 수정
	public int aReaAnswerUpdate(Reply r);
	
	// 관리자 문의사항 게시글 답변 삭제
	public int areqDelete(int reNo);
	
	




	
	

}
