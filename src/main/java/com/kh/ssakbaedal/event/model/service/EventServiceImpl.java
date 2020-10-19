package com.kh.ssakbaedal.event.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.event.model.dao.EventDao;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.event.model.vo.PageInfo;
import com.kh.ssakbaedal.event.model.vo.PointHistory;
import com.kh.ssakbaedal.event.model.vo.Search;
import com.kh.ssakbaedal.member.model.vo.Member;

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
	public int updateEvent(Event e) {
		return eDao.updateEvent(e);
	}
	
	@Override
	public int updateEventNImg(Event e, Attachment at) {
		int result1 = eDao.updateEvent(e);
		
		int refId = e.geteNo();
		at.setRefId(refId);
		
		int result2 = eDao.updateImg(at);
		
		int result = 0;
		
		if (result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public int deleteEvent(int eNo) {
		return eDao.deleteEvent(eNo);
	}

	@Override
	public ArrayList<Event> searchList(Search search) {
		return eDao.searchList(search);
	}

	@Override
	public int pointUpdate(Member updateMember, Integer eNo) {
		int result = 0;
		
		PointHistory ph = new PointHistory();
		ph.seteNo(eNo);
		ph.setmNo(updateMember.getmNo());
		ph.setPoint(updateMember.getPoint());
		
		int result1 = eDao.insertpHistory(ph);
		int result2 = eDao.pointUpdate(updateMember);
		
		if (result1 > 0 && result2 > 0) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public PointHistory pointHistory(PointHistory ph) {
		return eDao.pointHistory(ph);
	}



}
