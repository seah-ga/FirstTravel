package com.kh.ljh.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ljh.domain.CompanionVo;

@Repository
public class CompanionDaoImpl implements ICompanionDao {
	//sql mapper를 구현
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "companion"; 
	

	@Override
	public void insert(CompanionVo vo) throws Exception {
			sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	

}
