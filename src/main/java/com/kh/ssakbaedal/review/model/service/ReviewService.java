package com.kh.ssakbaedal.review.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.review.model.vo.Review;

public interface ReviewService {

	// 1. 리뷰 갯수 구하는 메소드 -> 페이징 계산을 위해
	public int selectListCount(int mNo);

	// 2. 리뷰 조회(페이징 처리 된)
	public ArrayList<Review> selectList(PageInfo pi, int mNo);

	// 3. 리뷰 작성
	public int insertReview(Review r);
	
	// 3_2. 리뷰와 파일 함께 작성
	public int insertReviewNImg(Review r, ArrayList<Attachment> files);

	// 4_1. 리뷰 상세보기
	public Review selectReview(int oNo);

	// 4_2. 이미지 셀렉
	public ArrayList<Attachment> selectImg(int oNo);

	// 5_1. 리뷰 수정
	public int updateReview(Review r);

	// 5_2. 이미지 수정
	public int updateReviewNImg(Review r, ArrayList<Attachment> alist);

	// 6. 리뷰 삭제
	public int deleteReview(int oNo);
}
