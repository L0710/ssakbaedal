package com.kh.ssakbaedal.storeSearch.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.storeSearch.model.vo.PageInfo;
import com.kh.ssakbaedal.storeSearch.model.vo.address;
import com.kh.ssakbaedal.storeSearch.model.vo.storeMenu;
import com.kh.ssakbaedal.storeSearch.model.vo.storeSearch;



public interface storeSearchService {
	
	// 1_1. 전체 매장 수 리턴 받기 -> 페이징 계산
	public int selectListCount(address add);
	
	// 1_2. 전체 매장 조회(페이징 처리 된)
	/*public ArrayList<storeSearch> selectList(PageInfo pi);*/
	
	// 전체 매장 조회 이미지포함 test
	public HashMap<String, Object> selectTestList(PageInfo pi, address add);
	
	// 2_1 한식 매장 전체 수 리턴 받기 -> 페이징 계산add
	public int selectKsListCount();
	
	// 2_2. 한식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectKsList(PageInfo pi);
	
	// 3_1. 중국집 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectCsListCount();
	
	// 3_2. 중국집 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectCsList(PageInfo pi);
	
	// 4_1. 돈까스,회,일식 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectJsListCount();
	
	// 4_2. 돈까스,회,일식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectjsList(PageInfo pi);
	
	// 5_1. 분식 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectSsListCount();
	
	// 5_2. 분식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectSsList(PageInfo pi);
	
	// 6_1. 치킨 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectChisListCount();
	
	// 6_2. 치킨 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectChisList(PageInfo pi);
	
	// 7_1. 피자 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectPsListCount();
	
	// 7_2. 피자 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectPsList(PageInfo pi);
	
	// 8_1. 패스트푸드 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectFsListCount();
	
	// 8_2. 패스트푸드 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectFsList(PageInfo pi);
	
	// 9_1. 아시안,양식 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectAsListCount();
	
	// 9_2. 아시안,양식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectAsList(PageInfo pi);
	
	// 10_1. 족발,보쌈 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectJosListCount();
	
	// 10_2. 족발,보쌈 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectJosList(PageInfo pi);
	
	// 11_1. 야식 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectYasListCount();
	
	// 11_2. 야식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectYasList(PageInfo pi);
	
	// 12_1. 찜,탕 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectJjsListCount();
	
	// 12_2. 야식 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectJjsList(PageInfo pi);
	
	// 13_1. 도시락 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectDosListCount();
	
	// 13_2. 도시락 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectDosList(PageInfo pi);
	
	// 14_1. 카페,디저트 매장 전체 수 리턴 받기 -> 페이징 계산
	public int selectCdsListCount();
	
	// 14_2. 도시락 매장 조회(페이징 처리 된)
	public ArrayList<storeSearch> selectCdsList(PageInfo pi);
	
	// 전체 매장에서 디테일 뷰 이동(매장 셀렉)
	public storeSearch selectstore(int mNo);
	// 전체 매장에서 디테일 뷰 이동(매장 메뉴 셀렉)
	public ArrayList<storeMenu> selectTosMenu(int mNo);
	// 전체 매장에서 디테일 뷰 이동(메뉴 이미지 셀렉)
	public ArrayList<Attachment> selectTosFile(int mNo);
	// 전체 매장에서 디테일 뷰 이동(매장 로고 셀렉)
	public Attachment selectToslFile(int mNo);

	
}
