package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.psj.domain.CityVo;

@Repository
public class CityDaoImpl implements ICityDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NAME_SPACE = "domesticCity"; 

	@Override
	public List<CityVo> getCities() {
		List<CityVo> list = sqlSession.selectList(NAME_SPACE + ".selectAllCity");
				
		return list;
	}

}
