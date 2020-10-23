package com.kh.ssakbaedal.store.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.Store;

public interface ManagementService {

	//회원번호->매장회원정보 select
	public Store selectStore(int mNo);
	//회원번호 ->매장영업DB
	public ArrayList<OpenDB> selectDB(int mNo);

	//매장 영업/하루휴무/기간휴무 설정
	public int updatesStatus(Store s);

	//매장 영업 DB insert
	public int insertDB(OpenDB db);
	
	//openDB 게시글 갯수 구하는 메소드
	public int selectListCount();
	
	//openDB 게시글 조회(페이징 처리 된)
	public ArrayList<OpenDB> selectList(PageInfo pi);





	
	




	
	

}

