package com.my.page.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.page.VO.PagingVO;
import com.my.page.VO.ProjectVO;
import com.my.page.VO.SkillVO;
import com.my.page.dao.ProjectDao;

@Repository("ProDao")
public class ProjectDaoImpl implements ProjectDao {
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;

	@Override
	public List<SkillVO> skillList() {
		return session.selectList("mapper.skill.selectSkillList");
	}

	@Override
	public String listCnt(PagingVO pagingVO) {
		return session.selectOne("mapper.project.listCnt", pagingVO);
	}

	@Override
	public List<ProjectVO> list(PagingVO pagingVO) {
		return session.selectList("mapper.project.list", pagingVO);
	}

	@Override
	public int insert(ProjectVO projectVO) {
		return session.insert("mapper.project.insert", projectVO);
	}

	@Override
	public int update(ProjectVO projectVO) {
		return session.update("mapper.project.update", projectVO);
	}

	@Override
	public ProjectVO GetProject(String pbIdx) {
		return session.selectOne("mapper.project.GetProject", pbIdx);
	}

	@Override
	public int delete(String[] checkList) {
		return session.delete("mapper.project.delete", checkList);
	}
	
	
}
