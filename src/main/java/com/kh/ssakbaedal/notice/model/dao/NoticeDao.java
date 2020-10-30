package com.kh.ssakbaedal.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.notice.model.vo.Notice;
import com.kh.ssakbaedal.notice.model.vo.nSearch;

@Repository("nDao")
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 관리자 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	// 관리자 공지사항 게시글 조회(페이징 처리 된)
	public ArrayList<Notice> selectnList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectnList", null, rowBounds);
	}
	
	// 고객센터 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectTnListCount() {
		return sqlSession.selectOne("noticeMapper.selectTnListCount");
	}
	
	// 고객센터 공지사항 게시글 조회(페이징 처리 된)
	public ArrayList<Notice> selectTnList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTnList", null, rowBounds);
	}
	
	// 매장회원 공지사항 게시글 갯수 구하는 메소드 -> 페이징 계산을 위한
	public int selectSnListCount() {
		return sqlSession.selectOne("noticeMapper.selectSnListCount");
	}
	
	// 매장회원 공지사항 게시글 조회
	public ArrayList<Notice> selectSnList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSnList", null, rowBounds);
	}
	
	// 공지사항 게시글 작성(파일이 없는 경우도 포함)
	public int noticeInsert(Notice n) {
		return sqlSession.insert("noticeMapper.noticeInsert", n);
	}
	// 공지사항 게시글 작성(파일 저장)
	public int noticeInsertFile(Attachment at) {
		return sqlSession.insert("noticeMapper.noticeInsertFile", at);
	}
	
	// 관리자 공지사항 게시글 상세보기
	public Notice selectaNotice(int nId) {
		return sqlSession.selectOne("noticeMapper.selectaNotice", nId);
	}
	
	// 관리자 공지사항 게시글 상세보기(파일)
	public Attachment selectaNoticeFile(int nId) {
		return sqlSession.selectOne("noticeMapper.selectaNoticeFile", nId);
	}
	
	// 고객센터 공지사항 게시글 상세보기
	public Notice selectToNotice(int nId) {
		return sqlSession.selectOne("noticeMapper.selectToNotice", nId);
	}
	
	// 고객센터 공지사항 게시글 상세보기(파일)
	public Attachment selectToNoticeFile(int nId) {
		return sqlSession.selectOne("noticeMapper.selectToNoticeFile", nId);
	}
	
	// 매장회원 공지사항 게시글 상세보기
	public Notice selectSnNotice(int nId) {
		return sqlSession.selectOne("noticeMapper.selectSnNotice", nId);
	}
	
	// 매장회원 공지사항 게시글 상세보기(파일)
	public Attachment selectSnNoticeFile(int nId) {
		return sqlSession.selectOne("noticeMapper.selectSnNoticeFile", nId);
	}
	
	// 관리자 공지사항 검색 시 게시글 갯수 구하기
	public int searchListCount(nSearch search) {
		return sqlSession.selectOne("noticeMapper.searchListCount", search);
	}
	
	// 관리자 공지사항 게시글 검색 
	public ArrayList<Notice> noticeSearchList(nSearch search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeSearchList", search, rowBounds);
	}
	
	// 고객센터 공지사항 검색 시 게시글 갯수 구하기
	public int searchTnListCount(nSearch search) {
		return sqlSession.selectOne("noticeMapper.searchTnListCount", search);
	}
	
	// 고객센터 공지사항 게시글 검색
	public ArrayList<Notice> tnoticeSearchList(nSearch search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.tnoticeSearchList", search, rowBounds);
	}
	
	// 매장회원 공지사항 검색 시 게시글 갯수 구하기
	public int searchSnListCount(nSearch search) {
		return sqlSession.selectOne("noticeMapper.searchSnListCount", search);
	}
	
	// 매장회원 공지사항 게시글 검색
	public ArrayList<Notice> snoticeSearchList(nSearch search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.snoticeSearchList", search, rowBounds);
	}
	
	// 관리자 공지사항 게시글 수정
	public int noticeUpdate(Notice n) {
		return sqlSession.update("noticeMapper.noticeUpdate", n);
	}
	
	// 관리자 공지사항 게시글 파일 수정
	public int noticeUpdateFile(Attachment at) {
		return sqlSession.update("noticeMapper.noticeUpdateFile", at);
	}
	
	// 공지사항 삭제
	public int deleteNotice(int nId) {
		return sqlSession.update("noticeMapper.deleteNotice", nId);
	}

	
	
	
	
	
}
