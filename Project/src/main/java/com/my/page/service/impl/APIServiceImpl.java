package com.my.page.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.my.page.VO.HmCodeVO;
import com.my.page.dao.APIDao;
import com.my.page.service.APIService;

@Repository("APIService")
public class APIServiceImpl implements APIService {
	@Resource(name="APIDao")
	private APIDao apiDao;

	@Override
	public int insert(HmCodeVO hmCode) {
		return apiDao.insert(hmCode);
	}

	@Override
	public List<HmCodeVO> list(HmCodeVO hmCode) {
		return apiDao.list(hmCode);
	}
}
