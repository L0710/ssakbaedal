package com.kh.ssakbaedal.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
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

	public int selectListCount() {
		
		return sqlSession.selectOne("managementMapper.selectListCount");
	}

	public ArrayList<OpenDB> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managementMapper.selectList", null, rowBounds);
	}

	
	
}
