package com.kh.ssakbaedal.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.store.model.vo.Menu;
import com.kh.ssakbaedal.store.model.vo.MenuList;
import com.kh.ssakbaedal.store.model.vo.Store;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public Member findId(Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);

	}

	public int checkId(Member m) {
		return sqlSession.selectOne("memberMapper.checkId", m);

	}

	public int insertStore(Store s, Attachment bf, Attachment sf) {
		int result = 0;

		result = sqlSession.insert("memberMapper.insertStore", s);
		if (result > 0) {
			result = sqlSession.insert("memberMapper.insertAttachment", bf);
			if (result > 0) {
				result = sqlSession.insert("memberMapper.insertAttachment", sf);
			}
		}
		return result;
	}

	public int insertMenu(Menu mn, Attachment f) {
		int result = 0;
		
		result = sqlSession.insert("memberMapper.insertMenu", mn);
		if (result > 0) {
			result = sqlSession.insert("memberMapper.minsertAttachment", f);
		}
		return result;
	}

}