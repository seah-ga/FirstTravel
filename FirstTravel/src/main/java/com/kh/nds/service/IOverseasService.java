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
	public List<OverseasHotelVo> selectHotel(OverseasHotelVo overseasHotelVo) throws Exception;
	
	// 에어포트에 맞는 이미지 불러오기 (도시이미지)
	public OverseasVo cityImage(String airPort) throws Exception;
	
}
