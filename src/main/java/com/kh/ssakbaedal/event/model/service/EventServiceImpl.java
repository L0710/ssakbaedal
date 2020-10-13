package com.kh.ssakbaedal.event.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Event selectEvent(int eNo, boolean flag) {
		// TODO Auto-generated method stub
		return null;
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
