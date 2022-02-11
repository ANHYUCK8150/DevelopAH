package com.my.page.service;

import com.my.page.VO.MemberVO;

public interface MemberService {

	String GetMemberIdx(String mbID);

	String GetMemberPhone(String mbPhone);

	int SetMember(MemberVO memberVO);

	MemberVO GetMember(MemberVO memberVO);

}
