package com.kh.ssakbaedal.require.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.require.model.dao.RequireDao;
import com.kh.ssakbaedal.require.model.vo.Require;

@Service("reService")
public class RequireServiceImpl implements RequireService {
	@Autowired
	private RequireDao reDao;
	
	// 일반회원 문의사항 게시글 갯수
	@Override
	public int reListCount(int mNo) {
		return reDao.reListCount(mNo);
	}
	
	// 일반회원 문의사항 게시글 조회
	@Override
	public ArrayList<Require> selectReList(PageInfo pi, int mNo) {
		return reDao.selectReList(pi, mNo);
	}
	
	// 일반회원 문의사항 상세보기
	@Override
	public Require uReqSelect(int reNo) {
		return reDao.uReqSelect(reNo);
	}
	
	// 일반회원 문의사항 게시글 상세보기(파일)
	@Override
	public Attachment uReqSelectFile(int reNo) {
		return reDao.uReqSelectFile(reNo);
	}
	
	// 일반회원 문의사항 게시글 작성하기(파일)
	@Override
	public int urequireInsertFile(Require re, Attachment at) {
		int result = 0;
		
		int result1 = reDao.urequireInsert(re);
		int result2 = reDao.urequireInsertFile(at);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 일반회원 문의사항 게시글 작성
	@Override
	public int urequireInsert(Require re) {
		return reDao.urequireInsert(re);
	}
	
	// 일반회원 문의사항 게시글 삭제
	@Override
	public int uReqDelete(int reNo) {
		return reDao.uReqDelete(reNo);
	}

	// 일반회원 문의사항 게시글 수정(파일)
	@Override
	public int ureqUpdateFile(Require re, Attachment at) {
		
		int result = 0;
		
		int result1 = reDao.ureqUpdate(re);
		
		int renId = re.getReNo();
		at.setRefId(renId);
		
		int result2 = reDao.ureqUpdateFile(at);
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 일반회원 문의사항 게시글 수정
	@Override
	public int ureqUpdate(Require re) {
		return reDao.ureqUpdate(re);
	}
	
	// 관리자 문의사항 게시글 갯수
	@Override
	public int aerqListCount() {
		return reDao.aerqListCount();
	}
	
	// 관리자 문의사항 게시글 조회
	@Override
	public ArrayList<Require> aSelectReList(PageInfo pi) {
		return reDao.aSelectReList(pi);
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력
	@Override
	public Require aReqSelete(int reNo) {
		return reDao.aReqSelete(reNo);
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력(파일)
	@Override
	public Attachment aReqSelectFile(int reNo) {
		return reDao.aReqSelectFile(reNo);
	}
	
	// 관리자 문의사항 게시글 답변 작성
	@Override
	public int aReaAnswerInsert(Reply r, Require re) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		result1 = reDao.aReAnswerInsert(r);
		
		if(result1 > 0) {
			result2 = reDao.aaReqUpdate(re);
		}
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력(답변 출력)
	@Override
	public Reply aReplyselect(int reNo) {
		return reDao.aReplyselect(reNo);
	}
	
	// 관리자 문의사항 게시글 답변 수정 뷰 이동
	@Override
	public Reply areqUpView(int rNo) {
		return reDao.areqUpView(rNo);
	}
	
	// 관리자 문의사항 게시글 답변 수정
	@Override
	public int aReaAnswerUpdate(Reply r) {
		return reDao.aReaAnswerUpdate(r);
	}
	
	// 관리자 문의사항 게시글 답변 삭제
	@Override
	public int areqDelete(int reNo) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		result1 = reDao.areqDelete(reNo);
		
		if(result1 > 0) {
			result2 = reDao.aareqDelete(reNo);
		}
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	

}
