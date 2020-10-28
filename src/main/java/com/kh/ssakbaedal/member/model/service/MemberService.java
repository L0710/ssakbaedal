package com.kh.ssakbaedal.member.model.service;

import java.util.ArrayList;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.vo.MenuList;
import com.kh.ssakbaedal.store.model.vo.Store;

public interface MemberService {

	public Member loginMember(Member m);
	
	
	public int checkId(Member m);
	
	
	public int insertMember(Member m);
	
	
	public int insertStore(Member m, Store s, Attachment b, Attachment sf, ArrayList<Attachment> files, MenuList menuList);
	

	public int deleteMember(String id);


	public Member findId(Member m);


	public Member findPwd(Member m);


	public int updatePwd(Member findPwd);

}






