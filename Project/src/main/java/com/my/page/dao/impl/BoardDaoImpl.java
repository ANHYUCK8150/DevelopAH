package com.my.page.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.page.VO.BoardVO;
import com.my.page.VO.PagingVO;
import com.my.page.dao.BoardDao;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;

	@Override
	public String listCnt(PagingVO pagingVO) {
		return session.selectOne("mapper.BoardMapper.listCnt", pagingVO);
	}

	@Override
	public List<BoardVO> list(PagingVO pagingVO) {
		return session.selectList("mapper.BoardMapper.list", pagingVO);
	}
}
