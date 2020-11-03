package com.kh.ssakbaedal.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PointHistory;
import com.kh.ssakbaedal.event.model.vo.Search;
import com.kh.ssakbaedal.member.model.vo.Member;

@Repository("eDao")
public class EventDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return sqlSession.selectOne("eventMapper.selectListCount");
	}

	public ArrayList<Event> selectList(PageInfo pi) {
		// 1 - offset : 몇 개의 게시글을 건너 뛸 것인지
		// 2 - boardLimit : 몇 개의 게시글을 select 할 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("eventMapper.selectList", null, rowBounds);
	}

	public int insertEvent(Event e) {
		return sqlSession.insert("eventMapper.insertEvent", e);
	}

	public int insertImg(Attachment at) {
		return sqlSession.insert("eventMapper.insertImg", at);
	}

	public void addReadCount(int eNo) {
		sqlSession.update("eventMapper.updateCount", eNo);		
	}

	public Event selectEvent(int eNo) {
		return sqlSession.selectOne("eventMapper.selectOne", eNo);
	}

	public Attachment selectImg(int eNo) {
		return sqlSession.selectOne("eventMapper.selectImg", eNo);
	}

	public int updateEvent(Event e) {
		return sqlSession.update("eventMapper.updateEvent", e);
	}

	public int updateImg(Attachment at) {
		return sqlSession.update("eventMapper.updateImg", at);
	}

	public int deleteEvent(int eNo) {
		return sqlSession.update("eventMapper.deleteEvent", eNo);
	}

	public ArrayList<Event> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("eventMapper.searchList", search, rowBounds);
	}

	public int pointUpdate(Member updateMember) {
		return sqlSession.update("eventMapper.pointUpdate", updateMember);
	}

	public int insertpHistory(PointHistory ph) {
		return sqlSession.insert("eventMapper.insertpHistory", ph);
	}

	public PointHistory pointHistory(PointHistory ph) {
		return sqlSession.selectOne("eventMapper.pHistory", ph);
	}

	public int searchListCount(Search search) {
		return sqlSession.selectOne("eventMapper.searchListCount", search);
	}

	public ArrayList<Reply> selectReplyList(int eNo) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectReplyList", eNo);
	}

	public int insertReply(Reply r) {
		return sqlSession.insert("eventMapper.insertReply", r);
	}

}
