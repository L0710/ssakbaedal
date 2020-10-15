package com.kh.ssakbaedal.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.member.model.dao.MemberDao;
import com.kh.ssakbaedal.member.model.vo.Member;
 

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = mDao.selectMember(m);
		System.out.println(loginUser);
		if(loginUser != null && 
				!bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())) {
	
			loginUser = null;
		}
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {

		String encPwd = bcryptPasswordEncoder.encode(m.getmPwd());
		m.setmPwd(encPwd);
		return mDao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	@Override
	public int checkIdDup(String id) {
		return mDao.checkIdDup(id);
	}

	@Override
	public int insertStore(Member m) {
		return 0;
	}

}
