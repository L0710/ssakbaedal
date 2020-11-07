package com.kh.ssakbaedal.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.MenuList;
import com.kh.ssakbaedal.store.model.vo.Store;

public interface MemberService {

	public Member loginMember(Member m);
	
	
	public int checkId(Member m);
	
	
	public int insertMember(Member m);
	
	
	public int insertStore(Member m, Store s, Attachment b, Attachment sf, ArrayList<Attachment> files, MenuList menuList);
	
	
	public Member mupdate(Member m);
	
	
	public int deleteMember(String id);


	public Member findId(Member m);


	public Member findPwd(Member m);


	public int updatePwd(Member findPwd);

	// (관리자)전체 회원 리스트 count
	public int selectmemListCount();

	// (관리자)전체 회원 리스트 조회
	public ArrayList<Member> selectmemList(PageInfo pi);

	// (관리자)회원 상태 변경
	public int updateStatus(int[] num);

	// (스케줄링)밴당한 회원 리스트 가져오기
	public ArrayList<Member> selectBannedList();

	// (스케줄링)회원 상태 n->y
	public int releaseMember(int mNo);

	//회원번호-> 매장회원정보 select
	public Store selectStore(int mNo);

	//회원번호-> 매장로고이미지 select
	public Attachment selectmImg(int mNo);

	//매장정보수정 + 로고이미지 수정
	public int updateLogo(Attachment attach);
	public int updateStore(Store s);

	//메뉴추가+메뉴사진추가
	public int insertMenuImg(Attachment attach, Menu m);
	public int insertMenu(Menu m);

	//메뉴삭제
	public int deleteSale(int mnNo);
	public Attachment selectOne(int mnNo);
	
	public ArrayList<Menu> selectMenu(int mNo);

	//메뉴수정
	public int updateMenu(ArrayList<Attachment> files, MenuList menuList);

	//총계산금액누적
	public int selectPriceSum(int mNo);





}






