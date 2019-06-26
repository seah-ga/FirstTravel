package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.nds.domain.OverseasHotelVo;
import com.kh.nds.domain.OverseasVo;
import com.kh.nds.persistence.IOverseasDao;

@Service
public class OverseasServiceImpl implements IOverseasService {

	@Inject
	private IOverseasDao overseasDao;
	
	@Override
	public List<OverseasVo> selectAllcountry() throws Exception {
		List<OverseasVo> list = overseasDao.selectAllcountry();
		return list;
	}

	@Override
	public List<OverseasVo> countryChk(String overseas_Country) throws Exception {
		List<OverseasVo> list = overseasDao.countryChk(overseas_Country);
		return list;
	}

	@Override
	public List<OverseasHotelVo> selectHotel(String hotel_date) throws Exception {
		List<OverseasHotelVo> list = overseasDao.selectHotel(hotel_date);
		return list;
	}

}
