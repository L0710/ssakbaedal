package com.kh.ssakbaedal.member.model.dao;
 
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.member.model.vo.Member;


@Repository("mDao") 
public class MemberDao {
 
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member m) {
		System.out.println(m);
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}



}