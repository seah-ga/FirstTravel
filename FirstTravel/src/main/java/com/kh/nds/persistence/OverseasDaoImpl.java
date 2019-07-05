package com.kh.nds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.nds.domain.OverseasHotelVo;
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

	@Override
	public List<OverseasVo> countryChk(String overseas_Country) throws Exception {
		List<OverseasVo> list = sqlSession.selectList(NAMESPACE + "countryChk", overseas_Country);
		return list;
	}

	@Override
	public List<OverseasHotelVo> selectHotel(OverseasHotelVo overseasHotelVo) throws Exception {
		List<OverseasHotelVo> list = sqlSession.selectList(NAMESPACE + "selecthotel", overseasHotelVo);
		return list;
	}

	@Override
	public OverseasVo cityImage(String airPort) throws Exception {
		OverseasVo vo = sqlSession.selectOne(NAMESPACE + "cityimage" , airPort);
		return vo;
	}

	@Override
	public List<OverseasVo> selectAlloverseas() throws Exception {
		List<OverseasVo> list = sqlSession.selectList(NAMESPACE + "selectAlloverseas");
		return list;
	}


}
