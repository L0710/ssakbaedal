package com.kh.ssakbaedal.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.no.No;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.review.model.vo.Review;
import com.kh.ssakbaedal.review.model.vo.V_Review;

@Repository("rDao")
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Review selectReview(int oNo) {
		return sqlSession.selectOne("reviewMapper.selectOne", oNo);
	}

	public int insertReview(Review r) {
		return sqlSession.insert("reviewMapper.insertReview", r);
	}

	public int insertImg(Attachment at) {
		return sqlSession.insert("reviewMapper.insertImg", at);
	}

	public int selectListCount(int mNo) {
		return sqlSession.selectOne("reviewMapper.selectListCount", mNo);
	}

	public ArrayList<Review> selectList(PageInfo pi, int mNo) {
		// 1 - offset : 몇 개의 게시글을 건너 뛸 것인지
		// 2 - boardLimit : 몇 개의 게시글을 select 할 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("reviewMapper.selectList", mNo, rowBounds);
	}

	public int deleteReview(int oNo) {
		return sqlSession.update("reviewMapper.deleteReview", oNo);
	}

	public int selectrListCount(int mNo) {
		return sqlSession.selectOne("reviewMapper.selectrListCount", mNo);
	}

	public ArrayList<Review> selectrList(PageInfo pi, int mNo) {
		// 1 - offset : 몇 개의 게시글을 건너 뛸 것인지
		// 2 - boardLimit : 몇 개의 게시글을 select 할 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectrList", mNo, rowBounds);
	}

	public V_Review selectRDetail(No no) {
		return sqlSession.selectOne("reviewMapper.selectRDetail", no);
	}

	public int deleteImg(int oNo) {
		return sqlSession.update("reviewMapper.deleteImg", oNo);
	}

	public ArrayList<Attachment> selectImg(int oNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectImg", oNo);
	}

	public String selectId(int oNo) {
		return sqlSession.selectOne("reviewMapper.selectId", oNo);
	}

	public int insertReply(Reply r) {
		return sqlSession.insert("reviewMapper.insertReply", r);
	}


}
