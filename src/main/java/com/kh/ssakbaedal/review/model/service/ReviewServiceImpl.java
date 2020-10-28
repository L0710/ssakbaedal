package com.kh.ssakbaedal.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.review.model.dao.ReviewDao;
import com.kh.ssakbaedal.review.model.vo.Review;

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
	public ArrayList<Attachment> selectImg(int oNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReviewNImg(Review r, ArrayList<Attachment> alist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int oNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
