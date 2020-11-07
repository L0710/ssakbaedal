package com.kh.ssakbaedal.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.no.No;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.review.model.dao.ReviewDao;
import com.kh.ssakbaedal.review.model.vo.Review;
import com.kh.ssakbaedal.review.model.vo.V_Review;

@Service("rService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao rDao;
	
	@Override
	public int selectListCount(int mNo) {
		return rDao.selectListCount(mNo);
	}

	@Override
	public ArrayList<Review> selectList(PageInfo pi, int mNo) {
		return rDao.selectList(pi, mNo);
	}
	
	@Override
	public int insertReview(Review r) {
		return rDao.insertReview(r);
	}

	@Override
	public int insertReviewNImg(Review r, ArrayList<Attachment> files) {
		int result = 0;
		int result1 = rDao.insertReview(r);
		int result2 = 0;
		
		for(Attachment at:files) 
        {
            at.setRefId(r.getoNo());
            result2 = rDao.insertImg(at);
        }
		
		if (result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public Review selectReview(int oNo) {
		return rDao.selectReview(oNo);
	}

	@Override
	public int deleteReview(int oNo) {
		return rDao.deleteReview(oNo);
	}

	@Override
	public int selectrListCount(int mNo) {
		return rDao.selectrListCount(mNo);
	}

	@Override
	public ArrayList<Review> selectrList(PageInfo pi, int mNo) {
		return rDao.selectrList(pi, mNo);
	}

	@Override
	public V_Review selectRDetail(No no) {
		return rDao.selectRDetail(no);
	}

	@Override
	public int deleteImg(int oNo) {
		return rDao.deleteImg(oNo);
	}

	@Override
	public ArrayList<Attachment> selectImg(int oNo) {
		return rDao.selectImg(oNo);
	}

	@Override
	public String selectId(int oNo) {
		return rDao.selectId(oNo);
	}

	@Override
	public int insertReply(Reply r) {
		return rDao.insertReply(r);
	}

	@Override
	public int reviewCount(int mNo) {
		return rDao.reviewCount(mNo);
	}

	@Override
	public int selectStar(int mNo) {
		return rDao.selectStar(mNo);
	}

	@Override
	public ArrayList<Review> selectReviewList(int mNo) {
		return rDao.selectReviewList(mNo);
	}


}
