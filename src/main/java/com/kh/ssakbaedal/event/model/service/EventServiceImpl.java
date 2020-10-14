package com.kh.ssakbaedal.event.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.event.model.dao.EventDao;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PageInfo;

@Service("eService")
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDao eDao;
	
	@Override
	public int selectListCount() {
		return eDao.selectListCount();
	}

	@Override
	public ArrayList<Event> selectList(PageInfo pi) {
		return eDao.selectList(pi);
	}

	@Override
	public int insertEvent(Event e) {
			return eDao.insertEvent(e);
	}
	
	@Override
	public int insertEventNImg(Event e, Attachment at) {
		int result1 = eDao.insertEvent(e);
		int result2 = eDao.insertImg(at);
		
		int result = 0;
		
		if (result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public Event selectEvent(int eNo, boolean flag) {
		// 1. 조회수 증가 처리
		if(!flag) {
			eDao.addReadCount(eNo);
		}
		
		// 2. 게시글 조회
		return eDao.selectEvent(eNo);
	}

	@Override
	public Attachment selectImg(int eNo) {
		Attachment at = eDao.selectImg(eNo);
//		System.out.println("at:"+at);
		return at;
	}
	
	@Override
	public int updateEvent(Event b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEvent(int eNo) {
		// TODO Auto-generated method stub
		return 0;
	}




}
