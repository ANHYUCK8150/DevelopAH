package com.my.page.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.page.VO.BoardReplyVO;
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

	@Override
	public int insert(Map<String,Object> params) {
		return session.insert("mapper.BoardMapper.insert", params);
	}

	@Override
	public int update(Map<String, Object> params) {
		if(!params.get("replyOption").equals("")) {
			return session.insert("mapper.BoardMapper.insertReply", params);
		}else {
			return session.update("mapper.BoardMapper.update",params);
		}
	}
	
	@Override
	public BoardVO listOne(String qbIdx) {
		return session.selectOne("mapper.BoardMapper.listOne", qbIdx);
	}

	@Override
	public List<BoardReplyVO> childList(String qbIdx) {
		return session.selectList("mapper.BoardMapper.childList", qbIdx);
	}

	@Override
	public String boardPWchk(Map<String, Object> map) {
		return session.selectOne("mapper.BoardMapper.boardPWchk", map);
	}

}
