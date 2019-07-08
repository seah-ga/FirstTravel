package com.kh.ljh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ljh.domain.CompanionReplyVo;

@Repository
public class CompanionReplyDaoImpl implements ICompanionReplyDao {
	
	private static final String NAMESPACE = "companionreply";
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(CompanionReplyVo companionReplyVo) throws Exception {
			sqlSession.insert(NAMESPACE + ".insert", companionReplyVo);

	}

	@Override
	public List<CompanionReplyVo> list(int companion_numbercode) throws Exception {
		List<CompanionReplyVo> list = sqlSession.selectList(NAMESPACE + ".list", companion_numbercode);
		return list;
	}

	@Override
	public void update(CompanionReplyVo companionReplyVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", companionReplyVo);
	}

	@Override
	public void delete(int companion_numbercode) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", companion_numbercode);
		
	}
	
	

}
