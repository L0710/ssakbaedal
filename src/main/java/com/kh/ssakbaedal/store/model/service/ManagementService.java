package com.kh.ssakbaedal.store.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.OpenDB;
import com.kh.ssakbaedal.store.model.vo.SetMenu;
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
	public int selectListCount(int mNo);
	
	//openDB 게시글 조회(페이징 처리 된)
	public ArrayList<OpenDB> selectList(PageInfo pi);
	
	//회원번호-> 매장메뉴 select
	public ArrayList<Menu> selectMenu(int mNo);
	
	//장기품절,하루품절설정
	public int updateLong(int mnNo);
	public int updateDay(int mnNo);
	
	//품절해제
	public int updateSale(int mnNo);
	
/*	//메뉴삭제
	public int deleteSale(int mnNo);*/
	
	//베스트메뉴로 등록
	public int upBest(int mnNo);
	//베스트메뉴로 등록해제
	public int delBest(int mnNo);
	
	//세트메뉴등록
	public Menu selectmnName(int mnNo);
	public int insertSetMenu(SetMenu sm);
	
	//회원번호-> 세트메뉴select
	public ArrayList<SetMenu> selectSetMenu(int mNo);
	
	//세트메뉴 삭제
	public int deleteSet(int smNo);
	
	//attachment select
	public ArrayList<Attachment> selectImg(int mNo);





	
	




	
	

}

