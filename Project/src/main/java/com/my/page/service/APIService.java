package com.my.page.service;

import java.util.List;

import com.my.page.VO.HmCodeVO;

public interface APIService {

	int insert(HmCodeVO hmCode);

	List<HmCodeVO> list(HmCodeVO hmCode);

}
