package com.my.page.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.page.VO.HmCodeVO;
import com.my.page.dao.APIDao;

@Repository("APIDao")
public class APIDaoImpl implements APIDao {
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;

	@Override
	public int insert(HmCodeVO hmCode) {
		return session.insert("mapper.hmCode.insert", hmCode);
	}

	@Override
	public List<HmCodeVO> list(HmCodeVO hmCode) {
		return session.selectList("mapper.hmCode.list", hmCode);
	}
	
	

}
