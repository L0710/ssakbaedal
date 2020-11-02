package com.kh.ssakbaedal.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.notice.model.dao.NoticeDao;
import com.kh.ssakbaedal.notice.model.vo.Notice;
import com.kh.ssakbaedal.notice.model.vo.nSearch;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nDao;
	
	// 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	@Override
	public int selectListCount() {
		return nDao.selectListCount();
	}
	
	// 관리자 공지사항 게시글 조회(페이징 처리 된)
	@Override
	public ArrayList<Notice> selectnList(PageInfo pi) {
		return nDao.selectnList(pi);
	}

	// 고객센터 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	@Override
	public int selectTnListCount() {
		return nDao.selectTnListCount();
	}
	
	// 고객센터 공지사항 게시글 조회(페이징 처리 된)
	@Override
	public ArrayList<Notice> selectTnList(PageInfo pi) {
		return nDao.selectTnList(pi);
	}
	
	// 매장회원 공지사항 게시글 갯수 구하는 메소등 -> 페이징 계산을 위해
	@Override
	public int selectSnListCount() {
		return nDao.selectSnListCount();
	}
	
	// 매장회원 공지사항 게시글 조회
	@Override
	public ArrayList<Notice> selectSnList(PageInfo pi) {
		return nDao.selectSnList(pi);
	}
	
	// 공지사항 게시글 작성(파일이 있을 경우)
	@Override
	public int noticeInsertFile(Notice n, Attachment at) {
		int result = 0;
		
		int result1 = nDao.noticeInsert(n);
		int result2 = nDao.noticeInsertFile(at);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 공지사항 게시글 작성(파일이 없는 경우)
	@Override
	public int noticeInsert(Notice n) {
		return nDao.noticeInsert(n);
	}
	
	// 관리자 공지사항 게시글 상세보기
	@Override
	public Notice selectaNotice(int nId) {
		return nDao.selectaNotice(nId);
	}
	
	// 관리자 공지사항 게시글 상세보기(파일)
	@Override
	public Attachment selectaNoticeFile(int nId) {
		return nDao.selectaNoticeFile(nId);
	}
	
	// 고객센터 공지사항 게시글 상세보기
	@Override
	public Notice selectToNotice(int nId) {
		return nDao.selectToNotice(nId);
	}
	
	// 고객센터 공지사항 게시글 상세보기(파일)
	@Override
	public Attachment selectToNoticeFile(int nId) {
		return nDao.selectToNoticeFile(nId);
	}
	
	// 매장회원 공지사항 게시글 상세보기
	@Override
	public Notice selectSnNotice(int nId) {
		return nDao.selectSnNotice(nId);
	}
	
	// 매장회원 공지사항 게시글 상세보기(파일)
	@Override
	public Attachment selectSnNoticeFile(int nId) {
		return nDao.selectSnNoticeFile(nId);
	}
	
	// 관리자 공지사항 검색 시 게시글 갯수 구하기
	@Override
	public int searchListCount(nSearch search) {
		return nDao.searchListCount(search);
	}
	
	// 관리자 공지사항 게시글 검색 
	@Override
	public ArrayList<Notice> noticeSearchList(nSearch search, PageInfo pi) {
		return nDao.noticeSearchList(search, pi);
	}
	
	// 고객센터 공지사항 검색 시 게시글 갯수 구하기
	@Override
	public int searchTnListCount(nSearch search) {
		return nDao.searchTnListCount(search);
	}
	
	// 고객센터 공지사항 게시글 검색
	@Override
	public ArrayList<Notice> tnoticeSearchList(nSearch search, PageInfo pi) {
		return nDao.tnoticeSearchList(search, pi);
	}
	
	// 매장회원 공지사항 검색 시 게시글 갯수 구하기
	@Override
	public int searchSnListCount(nSearch search) {
		return nDao.searchSnListCount(search);
	}
	
	// 매장회원 공지사항 게시글 검색
	@Override
	public ArrayList<Notice> snoticeSearchList(nSearch search, PageInfo pi) {
		return nDao.snoticeSearchList(search, pi);
	}
	
	// 관리자 공지사항 게시글 파일 수정
	@Override
	public int noticeUpdateFile(Notice n, Attachment at) {
		
		int result1 = nDao.noticeUpdate(n);
		
		int renId = n.getnId();
		at.setRefId(renId);
		
		int result2 = nDao.noticeUpdateFile(at);
		
		int result = 0;
		
		if (result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 관리자 공지사항 게시글 수정
	@Override
	public int noticeUpdate(Notice n) {
		return nDao.noticeUpdate(n);
	}

	@Override
	public int deleteNotice(int nId) {
		return nDao.deleteNotice(nId);
	}

	
	
	
	
	

}
