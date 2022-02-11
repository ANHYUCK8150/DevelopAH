package com.my.page.dao;

import com.my.page.VO.MemberVO;

public interface MemberDao {

	String GetMemberIdx(String mbID);

	String GetMemberPhone(String mbPhone);

	int SetMember(MemberVO memberVO);

	MemberVO GetMember(MemberVO memberVO);

}
