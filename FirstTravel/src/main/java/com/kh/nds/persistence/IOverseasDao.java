package com.kh.nds.persistence;

import java.util.List;

import com.kh.nds.domain.OverseasVo;

public interface IOverseasDao {
	// 검색 나라
	public List<OverseasVo> selectAllcountry() throws Exception;
	// 검색 나라에 따른 도시
	
	// 출발 월
}
