package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.psj.domain.TipRepVo;


@Repository
public class TipRepDaoImpl implements ITipRepDao{
	
	@Inject
	SqlSession sqlSession;
	final String NAME_SPACE = "tip_rep.";
	@Override
	public List<TipRepVo> select(int tip_no) throws Exception {
		List<TipRepVo> list =
				sqlSession.selectList(NAME_SPACE + "select", tip_no);
		return list;
	}

	@Override
	public void delete(TipRepVo tipRepVo) throws Exception {
		sqlSession.delete(NAME_SPACE + "delete", tipRepVo);
		
	}

	@Override
	public void insert(TipRepVo tipRepVo) throws Exception {
		sqlSession.insert(NAME_SPACE + "insert", tipRepVo); 
		
	}

	@Override
	public void update(TipRepVo tipRepVo) throws Exception {
		sqlSession.update(NAME_SPACE + "update", tipRepVo); 
		
	}

}
