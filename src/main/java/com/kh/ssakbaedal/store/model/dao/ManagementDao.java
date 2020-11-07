package com.kh.ssakbaedal.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.SetMenu;
import com.kh.ssakbaedal.store.model.vo.Store;

@Repository("smDao")
public class ManagementDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Store selectStore(int mNo) {
		
		return sqlSession.selectOne("managementMapper.selectStore", mNo);
	}


	public int updatesStatus(Store s) {
		
		return sqlSession.update("managementMapper.updatesStatus", s);
	}

	public int insertDB(OpenDB db) {

		return sqlSession.insert("managementMapper.insertDB", db);
	}

	public ArrayList<OpenDB> selectDB(int mNo) {
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectDB", mNo);
	}

	public int selectListCount(int mNo) {
		
		return sqlSession.selectOne("managementMapper.selectListCount", mNo);
	}

	public ArrayList<OpenDB> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectList", null, rowBounds);
	}

	public ArrayList<Menu> selectMenu(int mNo) {
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectMenu", mNo);
	}

	public int updateLong(int mnNo) {
		
		return sqlSession.update("managementMapper.updateLong", mnNo);
	}

	public int updateDay(int mnNo) {
		
		return sqlSession.update("managementMapper.updateDay", mnNo);
	}

	public int updateSale(int mnNo) {
		
		return sqlSession.update("managementMapper.updateSale", mnNo);
	}

/*	public int deleteMenu(int mnNo) {
		
		return sqlSession.update("managementMapper.deleteMenu", mnNo);
	}*/

	public int upBest(int mnNo) {
		
		return sqlSession.update("managementMapper.upBest",mnNo);
	}

	public int delBest(int mnNo) {
		
		return sqlSession.update("managementMapper.delBest", mnNo);
	}

	public Menu selectmnName(int mnNo) {
		
		return sqlSession.selectOne("managementMapper.selectmnName", mnNo);
	}

	public int insertSetMenu(SetMenu sm) {
		
		return sqlSession.insert("managementMapper.insertSetMenu", sm);
	}

	public ArrayList<SetMenu> selectSetMenu(int mNo) {
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectSetMenu", mNo);
	}

	public int deleteSet(int smNo) {
		
		return sqlSession.update("managementMapper.deleteSet", smNo);
	}


	public ArrayList<Attachment> selectMenuImg(int mNo) {
		
		return (ArrayList)sqlSession.selectList("managementMapper.selecMenutImg", mNo);
	}

	
	
}
