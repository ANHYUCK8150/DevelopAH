package com.my.page.dao.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.page.VO.MemberVO;
import com.my.page.dao.MemberDao;

@Repository("MemDao")
public class MemberDaoImpl implements MemberDao {
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;

	@Override
	public String GetMemberIdx(String mbID) {
		return session.selectOne("mapper.MemberMapper.GetMemberIdx", mbID);
	}

	@Override
	public String GetMemberPhone(String mbPhone) {
		return session.selectOne("mapper.MemberMapper.GetMemberPhone", mbPhone);
	}

	@Override
	public int SetMember(MemberVO memberVO) {
		return session.insert("mapper.MemberMapper.SetMember", memberVO);
	}

	@Override
	public MemberVO GetMember(MemberVO memberVO) {
		return session.selectOne("mapper.MemberMapper.GetMember", memberVO);
	}

}
