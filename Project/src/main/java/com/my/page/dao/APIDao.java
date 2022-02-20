package com.my.page.dao;

import java.util.List;

import com.my.page.VO.HmCodeVO;

public interface APIDao {

	int insert(HmCodeVO hmCode);

	List<HmCodeVO> list(HmCodeVO hmCode);

}
