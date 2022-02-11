package com.my.page.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.page.VO.MemberVO;
import com.my.page.dao.MemberDao;
import com.my.page.service.MemberService;

@Service("MemService")
public class MemberServiceImpl implements MemberService {
	@Resource(name = "MemDao")
	private MemberDao MemDao;

	@Override
	public String GetMemberIdx(String mbID) {
		return MemDao.GetMemberIdx(mbID);
	}

	@Override
	public String GetMemberPhone(String mbPhone) {
		return MemDao.GetMemberPhone(mbPhone);
	}

	@Override
	public int SetMember(MemberVO memberVO) {
		return MemDao.SetMember(memberVO);
	}

	@Override
	public MemberVO GetMember(MemberVO memberVO) {
		return MemDao.GetMember(memberVO);
	}

}
