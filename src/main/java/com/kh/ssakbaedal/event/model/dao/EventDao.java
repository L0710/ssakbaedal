package com.kh.ssakbaedal.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PageInfo;

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

}
