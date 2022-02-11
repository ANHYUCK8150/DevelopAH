package com.my.page.dao.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.page.dao.BoardDao;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
}
