package com.kh.nds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.nds.domain.OverseasVo;

@Repository
public class OverseasDaoImpl implements IOverseasDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "overseas.";
	
	@Override
	public List<OverseasVo> selectAllcountry() throws Exception {
		List<OverseasVo> list = sqlSession.selectList(NAMESPACE + "selectAllcountry");
		
		return list;
	}

}
