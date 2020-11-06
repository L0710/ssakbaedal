package com.kh.ssakbaedal.member.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.event.model.vo.Event;
import com.kh.ssakbaedal.member.model.vo.Member;
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

	// 회원번호 기준으로 회원 정보 가져오기
	public Member selectMemberInfo(int mNo);


}






