package com.kh.psj.persistence;

import java.util.List;

import com.kh.psj.domain.CityVo;

public interface ICityDao {
	public List<CityVo> getCities() throws Exception;

}
