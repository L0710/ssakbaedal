package com.kh.ssakbaedal.review.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.no.No;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.review.model.vo.Review;
import com.kh.ssakbaedal.review.model.vo.V_Review;

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

	// 6. 리뷰 삭제
	public int deleteReview(int oNo);

	// 6_1. 이미지 리스트
	public ArrayList<Attachment> selectImg(int oNo);
	
	// 6_2. 이미지 삭제
	public int deleteImg(int oNo);
	
	// 리뷰 갯수구하는 메소드(매장)
	public int selectrListCount(int mNo);
	
	// 리뷰 리스트(매장)
	public ArrayList<Review> selectrList(PageInfo pi, int mNo);

	// 리뷰 상세(매장)
	public V_Review selectRDetail(No no);

	// 리뷰 상세(작성자ID)
	public String selectId(int oNo);

	// 답글 작성(매장)
	public int insertReply(Reply r);

	// 매장 별 리뷰 수 카운트
	public int reviewCount(int mNo);

	// 매장 별 별점 합
	public int selectStar(int mNo);

	// 매장디테일 - 리뷰 리스트 출력
	public ArrayList<Review> selectReviewList(int mNo);



}
