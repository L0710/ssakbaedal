package com.kh.ssakbaedal.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.member.model.dao.MemberDao;
import com.kh.ssakbaedal.member.model.exception.MemberException;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.MenuList;
import com.kh.ssakbaedal.store.model.vo.Store;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public int insertMember(Member m) {
		String encPwd = bcryptPasswordEncoder.encode(m.getmPwd());
		m.setmPwd(encPwd);
		m.setmType("2");
		return mDao.insertMember(m);
	}

	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}
	
	@Override
	public int checkId(Member m) {
		return mDao.checkId(m);

	}

	@Override
	public int insertStore(Member m, Store s, Attachment bf, Attachment sf, ArrayList<Attachment> files,
			MenuList menuList) {
		int result = 0;

		String encPwd = bcryptPasswordEncoder.encode(m.getmPwd());
		m.setmPwd(encPwd);
		m.setmType("3");
		m.setmStatus("N");
		result = mDao.insertMember(m);
		if (result == 0) {
			throw new MemberException("회원가입 실패");
		}else {
			bf.setaType(6);
			sf.setaType(8);
			result = mDao.insertStore(s, bf, sf);
			if (result == 0) {
				throw new MemberException("매장 입력 실패");
			} else {
				for (int i = 0; i < menuList.getMenuList().size(); i++) {
					Menu mn = menuList.getMenuList().get(i);
					Attachment f = files.get(i);
					f.setaType(5);
					result = mDao.insertMenu(mn, f);
					if (result == 0) {throw new MemberException("메뉴 삽입 실패");}
				}
			}
		}
		return result;
	}

	@Override
	public Member loginMember(Member m) {

		Member loginUser = mDao.selectMember(m);
		System.out.println(loginUser);
		if (loginUser != null && !bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())) {
			loginUser = null;
		}
		return loginUser;
	}
	
	@Override
	public Member mupdate(Member m) {
		String encPwd = bcryptPasswordEncoder.encode(m.getmPwd());
		m.setmPwd(encPwd);
		return mDao.mupdate(m);
	}
	
	
	@Override
	public Member findId(Member m) {
		return mDao.findId(m);
	}

	@Override
	public Member findPwd(Member m) {
		return mDao.findPwd(m);
	}

	@Override
	public int updatePwd(Member findPwd) {
		String encPwd = bcryptPasswordEncoder.encode(findPwd.getmPwd());
		findPwd.setmPwd(encPwd);
		return mDao.updatePwd(findPwd);
	}

	@Override
	public int selectmemListCount() {
		return mDao.selectmemListCount();
	}

	@Override
	public ArrayList<Member> selectmemList(PageInfo pi) {
		return mDao.selectmemList(pi);
	}

	@Override
	public int updateStatus(int[] num) {
		int result = 0;
		
		for(int i = 0; i < num.length; i++) {
			result += mDao.updateStatus(num[i]);
		}
		
		if(result < num.length) {
			return 0;
		}else {
			return 1;
		}
	}

	@Override
	public ArrayList<Member> selectBannedList() {
		return mDao.selectBannedList();
	}

	@Override
	public int releaseMember(int mNo) {
		return mDao.releaseMember(mNo);
	}

}




