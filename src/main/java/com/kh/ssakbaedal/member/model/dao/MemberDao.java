package com.kh.ssakbaedal.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.attachment.FileList;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.member.model.vo.Member;
import com.kh.ssakbaedal.order.model.vo.Order;
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

   public int deleteMember(String id) {
      return sqlSession.update("memberMapper.deleteMember", id);
   }

   public int checkId(Member m) {
      return sqlSession.selectOne("memberMapper.checkId", m);

   }

   public int insertMember(Member m) {
      return sqlSession.insert("memberMapper.insertMember", m);
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

   public Member findId(Member m) {
      return sqlSession.selectOne("memberMapper.findId", m);
   }

   public Member findPwd(Member m) {
      return sqlSession.selectOne("memberMapper.findPwd", m);
   }

   public int updatePwd(Member findPwd) {
      return sqlSession.update("memberMapper.updatePwd", findPwd);
   }


   public Member mupdate(Member m) {
      int result = sqlSession.update("memberMapper.mupdate", m);
      if (result > 0) {
         return   sqlSession.selectOne("memberMapper.selectOne", m);
      }
      return null;
    }

   public int selectmemListCount() {
      return sqlSession.selectOne("memberMapper.selectmemListCount");
   }

   public ArrayList<Member> selectmemList(PageInfo pi) {
      // 1 - offset : 몇 개의 게시글을 건너 뛸 것인지
      // 2 - boardLimit : 몇 개의 게시글을 select 할 것인지
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      return (ArrayList) sqlSession.selectList("memberMapper.selectmemList", null, rowBounds);
   }

   public int updateStatus(int mNo) {
      return sqlSession.update("memberMapper.updateStatus", mNo);
   }

   public ArrayList<Member> selectBannedList() {
      return (ArrayList)sqlSession.selectList("memberMapper.selectBannedList");
   }

   public int releaseMember(int mNo) {
      return sqlSession.update("memberMapper.releaseMember", mNo);
   }


   public Store selectStore(int mNo) {
      
      return sqlSession.selectOne("memberMapper.selectStore", mNo);
   }

   public Attachment selectmImg(int mNo) {
      
      return sqlSession.selectOne("memberMapper.selectmImg", mNo);
   }

   public int updateStore(Store s) {
      
      return sqlSession.update("memberMapper.updateStore", s);
   }

   public int updateLogo(Attachment attach) {
      
      return sqlSession.update("memberMapper.updateLogo", attach);
   }

   public int insertMenuImg(Attachment attach) {
      
      return sqlSession.insert("memberMapper.insertMenuImg", attach);
   }

   public int insertsMenu(Menu m) {
      
      return sqlSession.insert("memberMapper.insertsMenu", m);
   }

   public ArrayList<Menu> selectMenu(int mNo) {
      
      return (ArrayList)sqlSession.selectList("memberMapper.selectMenu", mNo);
   }

   public int deleteMenu(int mnNo) {

      return sqlSession.update("memberMapper.deleteMenu", mnNo);
   }

   public Attachment selectOne(int mnNo) {
      int refId = mnNo;
      return sqlSession.selectOne("memberMapper.selectaOne", refId);
   }

/*   public int updateMenu(Menu menu, Attachment file) {
      int result = 0;

      result = sqlSession.update("memberMapper.updateMenu", menu);
      if (result > 0) {
         result = sqlSession.insert("memberMapper.updateMenuImg", file);
      }
      return result;
   }*/

   public int updateMenuImg(Attachment file) {
      
      return sqlSession.insert("memberMapper.updateMenuImg", file);
   }

   public int updateMenu(Menu menu) {
      
      return sqlSession.update("memberMapper.updateMenu", menu);
   }

   public int selectPriceSum(int mNo) {
      
      return sqlSession.selectOne("memberMapper.selectPriceSum", mNo);
   }

   public Member selectMemberInfo(int mNo) {
      return sqlSession.selectOne("memberMapper.selectMemberInfo", mNo);
   }

   public int usingOrder(Order o) {
      return sqlSession.update("memberMapper.usingOrder", o);

   }

}