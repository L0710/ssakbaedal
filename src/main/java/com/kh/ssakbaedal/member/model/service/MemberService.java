package com.kh.ssakbaedal.member.model.service;

import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.vo.Store;

public interface MemberService {

	public Member loginMember(Member m);
	

	public int insertMember(Member m);
	
	
	public int insertStore(Member m);


	public int updateMember(Member m);
	

	public int deleteMember(String id);


	public Member findId(Member m);


	public int checkId(Member m);

}






