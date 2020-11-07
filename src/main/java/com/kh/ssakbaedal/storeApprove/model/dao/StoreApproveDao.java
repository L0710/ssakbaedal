package com.kh.ssakbaedal.storeApprove.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.storeApprove.model.vo.StoreAppro;

@Repository("saDao")
public class StoreApproveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 관리자 미승인 매장회원 리스트 갯수
	public int selectListCount() {
		return sqlSession.selectOne("storeApproveMapper.selectListCount");
	}
	
	// 관리자 미승인 매장회원 리스트 출력
	public ArrayList<StoreAppro> storeApproveList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeApproveMapper.storeApproveList", null, rowBounds);
	}
	
	// 관리자 미승인 매장회원 디테일 뷰 출력
	public StoreAppro selectStoreAp(int mNo) {
		return sqlSession.selectOne("storeApproveMapper.selectStoreAp", mNo);
	}
	
	// 관리자 미승인 매장회원 디테일 뷰 출력(파일)
	public Attachment selectsaFile(int mNo) {
		return sqlSession.selectOne("storeApproveMapper.selectsaFile", mNo);
	}
	
	// 관리자 미승인 매장회원 승인
	public int storeApprove(int mNo) {
		return sqlSession.update("storeApproveMapper.storeApprove", mNo);
	}
	

}
