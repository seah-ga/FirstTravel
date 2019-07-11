package com.kh.ljh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;
import com.kh.nds.domain.OverseasVo;

@Repository
public class CompanionDaoImpl implements ICompanionDao {
	//sql mapper를 구현
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "companion"; 
	
	//글쓰기 
	@Override
	public void insert(CompanionVo vo) throws Exception {
			sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	//글목록
	@Override
	public List<CompanionVo> list(PagingDto pagingDto) throws Exception {
			List<CompanionVo> list = sqlSession.selectList(NAMESPACE + ".list", pagingDto);
		return list;
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".listCount", pagingDto);
		return count;
	}
	//글을읽기
	@Override
	public CompanionVo read(int companion_numbercode) throws Exception {
		CompanionVo companionVo = sqlSession.selectOne(NAMESPACE + ".read", companion_numbercode);
		return companionVo;
	}
	//글을 수정
	@Override
	public void update(CompanionVo companionVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", companionVo);
	}

	@Override
	public void delete(int companion_numbercode) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", companion_numbercode);
		
	}
	
	//댓글수의 업데이트 
	@Override
	public void updateReplyCount(int companion_numbercode) throws Exception {
		sqlSession.update(NAMESPACE + ".update", companion_numbercode);
	}

	

}
