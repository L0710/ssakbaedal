package com.kh.ssakbaedal.notice.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.notice.model.vo.Notice;
import com.kh.ssakbaedal.notice.model.vo.nSearch;

public interface NoticeService {
	
	// 관리자 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount();
	
	// 관리자 공지사항 게시글 조회(페이징 처리 된)
	public ArrayList<Notice> selectnList(PageInfo pi);

	// 고객센터 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectTnListCount();
	
	// 고객센터 공지사항 게시글 조회(페이징 처리 된)
	public ArrayList<Notice> selectTnList(PageInfo pi);
	
	// 매장회원 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectSnListCount();
	
	// 매장회원 공지사항 게시글 조회(페이징 처리 된)
	public ArrayList<Notice> selectSnList(PageInfo pi);
	
	// 공지사항 게시글 작성(파일이 있을 경우)
	public int noticeInsertFile(Notice n, Attachment at);
	
	// 공지사항 게시글 작성(파일이 없는 경우)
	public int noticeInsert(Notice n);
	
	// 관리자 공지사항 게시글 상세보기
	public Notice selectaNotice(int nId);
	
	// 관리자 공지사항 게시글 상세보기(파일)
	public Attachment selectaNoticeFile(int nId);
	
	// 고객센터 공지사항 게시글 상세보기
	public Notice selectToNotice(int nId);
	
	// 고객센터 공지사항 게시글 상세보기(파일)
	public Attachment selectToNoticeFile(int nId);
	
	// 매장회원 공지사항 게시글 상세보기
	public Notice selectSnNotice(int nId);
	
	// 매장회원 공지사항 게시글 상세보기(파일)
	public Attachment selectSnNoticeFile(int nId);
	
	// 관리자 공지사항 검색 시 게시글 갯수 구하기
	public int searchListCount(nSearch search);
	
	// 관리자 공지사항 게시글 검색 
	public ArrayList<Notice> noticeSearchList(nSearch search, PageInfo pi);
	
	// 고객센터 공지사항 검색 시 게시글 갯수 구하기
	public int searchTnListCount(nSearch search);
	
	// 고객센터 공지사항 게시글 검색
	public ArrayList<Notice> tnoticeSearchList(nSearch search, PageInfo pi);
	
	// 매장회원 공지사항 검색 시 게시글 갯수 구하기
	public int searchSnListCount(nSearch search);
	
	// 매장회원 공지사항 게시글 검색
	public ArrayList<Notice> snoticeSearchList(nSearch search, PageInfo pi);
	
	// 관리자 공지사항 게시글 파일 수정
	public int noticeUpdateFile(Notice n, Attachment at);
	
	// 관리자 공지사항 게시글 수정
	public int noticeUpdate(Notice n);
	
	// 공지사항 삭제
	public int deleteNotice(int nId);
	
	
	

}
