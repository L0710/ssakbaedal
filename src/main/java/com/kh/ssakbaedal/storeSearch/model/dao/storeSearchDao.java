package com.kh.ssakbaedal.storeSearch.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.storeSearch.model.vo.PageInfo;
import com.kh.ssakbaedal.storeSearch.model.vo.storeSearch;



@Repository("sDao")
public class storeSearchDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1_1. 전체 매장 수 리턴 받기 -> 페이징 계산
	public int slectListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectListCount");
	}
	
	// 1_2. 전체 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectList", null, rowBounds);
	}
	
	// 2_1. 한식 매장 전체 수 조회 -> 페이징 계산
	public int selectKsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectKsListCount");
	}
	
	// 2_2. 한식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectKsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectKsList", null, rowBounds);
	}
	
	// 3_1. 중국집 매장 전체 수 조회 -> 페이징 계산
	public int selectCsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectCsListCount");
	}
	
	// 3_2. 중국집 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectCsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectCsList", null, rowBounds);
	}

	// 4_1. 돈까스,회,일식 매장 전체 수 조회 -> 페이징 계산
	public int selectJsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectJsListCount");
	}
	
	// 4_2. 돈까스,회,일식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectjsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectJsList", null, rowBounds);
	}
	
	// 5_1. 분식 매장 전체 수 조회 -> 페이징 계산
	public int selectSsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectSsListCount");
	}
	
	// 5_2. 분식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectSsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectSsList", null, rowBounds);
	}
	
	// 6_1. 치킨 매장 전체 수 조회 -> 페이징 계산
	public int selectChisListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectChisListCount");
	}
	
	// 6_2. 치킨 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectChisList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectChisList", null, rowBounds);
	}
	
	// 7_1. 피자 매장 전체 수 조회 -> 페이징 계산
	public int selectPsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectPsListCount");
	}
	
	// 7_2. 피자 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectPsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectPsList", null, rowBounds);
	}
	
	// 8_1. 패스트푸드 매장 전체 수 조회 -> 페이징 계산
	public int selectFsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectFsListCount");
	}
	
	// 8_2. 패스트푸드 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectFsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectFsList", null, rowBounds);
	}
	
	// 9_1. 아시안,양식 매장 전체 수 조회 -> 페이징 계산
	public int selectAsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectAsListCount");
	}
	
	// 9_2. 아시안,양식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectAsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectAsList", null, rowBounds);
	}
	
	// 10_1. 족발,보쌈 매장 전체 수 조회 -> 페이징 계산
	public int selectJosListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectJosListCount");
	}
	
	// 10_2. 족발,보쌈 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectJosList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectJosList", null, rowBounds);
	}
	
	// 11_1. 야식 매장 전체 수 조회 -> 페이징 계산
	public int selectYasListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectYasListCount");
	}
	
	// 11_2. 족발,보쌈 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectYasList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectYasList", null, rowBounds);
	}
	
	// 12_1. 찜,탕 매장 전체 수 조회 -> 페이징 계산
	public int selectJjsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectJjsListCount");
	}
	
	// 12_2. 찜,탕 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectJjsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectJjsList", null, rowBounds);
	}
	
	// 13_1. 도시락 매장 전체 수 조회 -> 페이징 계산
	public int selectDosListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectDosListCount");
	}
	
	// 13_2. 도시락 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectDosList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectDosList", null, rowBounds);
	}
	
	// 14_1. 카페,디저트 매장 전체 수 조회 -> 페이징 계산
	public int selectCdsListCount() {
		return sqlSession.selectOne("storeSearchMapper.selectCdsListCount");
	}
	
	// 14_2. 카페,디저트 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectCdsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeSearchMapper.selectCdsList", null, rowBounds);
	}
	
	

}
