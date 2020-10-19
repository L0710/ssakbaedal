package com.kh.ssakbaedal.storeSearch.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.storeSearch.model.dao.storeSearchDao;
import com.kh.ssakbaedal.storeSearch.model.vo.PageInfo;
import com.kh.ssakbaedal.storeSearch.model.vo.storeSearch;



@Service("sService")
public class storeSearchServiceImpl implements storeSearchService {

	@Autowired
	private storeSearchDao sDao;
	
	// 1_1. 전체 매장 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectListCount() {
		return sDao.slectListCount();
	}
	
	// 1_2. 전체 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectList(PageInfo pi) {
		return sDao.selectList(pi);
	}
	
	// 2_1. 한식 매장 전체 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectKsListCount() {
		return sDao.selectKsListCount();
	}
	
	// 2_2.한식 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectKsList(PageInfo pi) {
		return sDao.selectKsList(pi);
	}
	
	// 3_1. 중국집 매장  전체 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectCsListCount() {
		return sDao.selectCsListCount();
	}
	
	// 3_2. 중국집 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectCsList(PageInfo pi) {
		return sDao.selectCsList(pi);
	}
	
	// 4_1. 돈까스,회,일식 매장 전체 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectJsListCount() {
		return sDao.selectJsListCount();
	}

	// 4_2. 돈까스,회,일식 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectjsList(PageInfo pi) {
		return sDao.selectjsList(pi);
	}
	
	// 5_1. 분식 매장 전체 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectSsListCount() {
		return sDao.selectSsListCount();
	}
	
	// 5_2. 분식 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectSsList(PageInfo pi) {
		return sDao.selectSsList(pi);
	}
	
	// 6_1. 치킨 매장 전체 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectChisListCount() {
		return sDao.selectChisListCount();
	}
	
	// 6_2. 치킨 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectChisList(PageInfo pi) {
		return sDao.selectChisList(pi);
	}
	
	// 7_1. 피자 매장 전체 수 리턴 받기 -> 페이징 계산
	@Override
	public int selectPsListCount() {
		return sDao.selectPsListCount();
	}
	
	// 7_2. 피자 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectPsList(PageInfo pi) {
		return sDao.selectPsList(pi);
	}
	
	// 8_1. 패스트푸드 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectFsListCount() {
		return sDao.selectFsListCount();
	}
	
	// 8_2. 패스트푸드 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectFsList(PageInfo pi) {
		return sDao.selectFsList(pi);
	}
	
	// 9_1. 아시안,양식 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectAsListCount() {
		return sDao.selectAsListCount();
	}
	
	// 9_2. 아시안,양식 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectAsList(PageInfo pi) {
		return sDao.selectAsList(pi);
	}
	
	// 10_1. 족발,보쌈 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectJosListCount() {
		return sDao.selectJosListCount();
	}
	
	// 10_2. 족발,보쌈 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectJosList(PageInfo pi) {
		return sDao.selectJosList(pi);
	}
	
	// 11_1. 야식 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectYasListCount() {
		return sDao.selectYasListCount();
	}
	
	// 11_2. 야식 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectYasList(PageInfo pi) {
		return sDao.selectYasList(pi);
	}
	
	// 12_1. 찜,탕 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectJjsListCount() {
		return sDao.selectJjsListCount();
	}
	
	// 12_2. 야식 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectJjsList(PageInfo pi) {
		return sDao.selectJjsList(pi);
	}
	
	// 13_1. 도시락 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectDosListCount() {
		return sDao.selectDosListCount();
	}
	
	// 13_2. 도시락 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectDosList(PageInfo pi) {
		return sDao.selectDosList(pi);
	}
	
	// 14_1. 카페,디저트 매장 전체 수리턴 받기 -> 페이징 계산
	@Override
	public int selectCdsListCount() {
		return sDao.selectCdsListCount();
	}
	
	// 14_2. 카페,디저트 매장 조회(페이징 처리 된)
	@Override
	public ArrayList<storeSearch> selectCdsList(PageInfo pi) {
		return sDao.selectCdsList(pi);
	}
	
	
	
	
	
}
