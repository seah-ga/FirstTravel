package com.kh.nds.service;

import java.util.List;

import com.kh.nds.domain.OverseasHotelVo;
import com.kh.nds.domain.OverseasVo;

public interface IOverseasService {
	// 검색 나라
	public List<OverseasVo> selectAllcountry() throws Exception;
	// 검색 나라에 따른 도시

	List<OverseasVo> countryChk(String overseas_Country) throws Exception;
	
	// 날짜에 따른 호텔
	public List<OverseasHotelVo> selectHotel(String hotel_date) throws Exception;
}
