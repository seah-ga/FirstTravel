package com.kh.psj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.psj.domain.CityVo;
import com.kh.psj.persistence.ICityDao;

@Service
public class CityServiceImpl implements ICityService {
	@Inject
	ICityDao CityDao;
	@Override
	public List<CityVo> getAllCities() {
		List<CityVo> list = CityDao.getCities();
		return list;
	}

}
