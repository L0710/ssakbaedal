package com.kh.ssakbaedal.search.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.search.model.vo.PageInfo;
import com.kh.ssakbaedal.search.model.vo.Search;

@Repository("sDao")
public class SearchDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1_1. 전체 매장 수 리턴 받기 -> 페이징 계산
	public int slectListCount() {
		return sqlSession.selectOne("searchMapper.selectListCount");
	}
	
	// 1_2. 전체 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectList", null, rowBounds);
	}
	
	// 2_1. 한식 매장 전체 수 조회 -> 페이징 계산
	public int selectKsListCount() {
		return sqlSession.selectOne("searchMapper.selectKsListCount");
	}
	
	// 2_2. 한식 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectKsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectKsList", null, rowBounds);
	}
	
	// 3_1. 중국집 매장 전체 수 조회 -> 페이징 계산
	public int selectCsListCount() {
		return sqlSession.selectOne("searchMapper.selectCsListCount");
	}
	
	// 3_2. 중국집 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectCsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectCsList", null, rowBounds);
	}

	// 4_1. 돈까스,회,일식 매장 전체 수 조회 -> 페이징 계산
	public int selectJsListCount() {
		return sqlSession.selectOne("searchMapper.selectJsListCount");
	}
	
	// 4_2. 돈까스,회,일식 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectjsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectJsList", null, rowBounds);
	}
	
	// 5_1. 분식 매장 전체 수 조회 -> 페이징 계산
	public int selectSsListCount() {
		return sqlSession.selectOne("searchMapper.selectSsListCount");
	}
	
	// 5_2. 분식 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectSsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectSsList", null, rowBounds);
	}
	
	// 6_1. 치킨 매장 전체 수 조회 -> 페이징 계산
	public int selectChisListCount() {
		return sqlSession.selectOne("searchMapper.selectChisListCount");
	}
	
	// 6_2. 치킨 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectChisList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectChisList", null, rowBounds);
	}
	
	// 7_1. 피자 매장 전체 수 조회 -> 페이징 계산
	public int selectPsListCount() {
		return sqlSession.selectOne("searchMapper.selectPsListCount");
	}
	
	// 7_2. 피자 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectPsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectPsList", null, rowBounds);
	}
	
	// 8_1. 패스트푸드 매장 전체 수 조회 -> 페이징 계산
	public int selectFsListCount() {
		return sqlSession.selectOne("searchMapper.selectFsListCount");
	}
	
	// 8_2. 패스트푸드 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectFsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectFsList", null, rowBounds);
	}
	
	// 9_1. 아시안,양식 매장 전체 수 조회 -> 페이징 계산
	public int selectAsListCount() {
		return sqlSession.selectOne("searchMapper.selectAsListCount");
	}
	
	// 9_2. 아시안,양식 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectAsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectAsList", null, rowBounds);
	}
	
	// 10_1. 족발,보쌈 매장 전체 수 조회 -> 페이징 계산
	public int selectJosListCount() {
		return sqlSession.selectOne("searchMapper.selectJosListCount");
	}
	
	// 10_2. 족발,보쌈 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectJosList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectJosList", null, rowBounds);
	}
	
	// 11_1. 야식 매장 전체 수 조회 -> 페이징 계산
	public int selectYasListCount() {
		return sqlSession.selectOne("searchMapper.selectYasListCount");
	}
	
	// 11_2. 족발,보쌈 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectYasList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectYasList", null, rowBounds);
	}
	
	// 12_1. 찜,탕 매장 전체 수 조회 -> 페이징 계산
	public int selectJjsListCount() {
		return sqlSession.selectOne("searchMapper.selectJjsListCount");
	}
	
	// 12_2. 찜,탕 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectJjsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectJjsList", null, rowBounds);
	}
	
	// 13_1. 도시락 매장 전체 수 조회 -> 페이징 계산
	public int selectDosListCount() {
		return sqlSession.selectOne("searchMapper.selectDosListCount");
	}
	
	// 13_2. 도시락 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectDosList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectDosList", null, rowBounds);
	}
	
	// 14_1. 카페,디저트 매장 전체 수 조회 -> 페이징 계산
	public int selectCdsListCount() {
		return sqlSession.selectOne("searchMapper.selectCdsListCount");
	}
	
	// 14_2. 카페,디저트 매장 조회(페이징 처리 된)
	public ArrayList<Search> selectCdsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("searchMapper.selectCdsList", null, rowBounds);
	}
	
	

}
