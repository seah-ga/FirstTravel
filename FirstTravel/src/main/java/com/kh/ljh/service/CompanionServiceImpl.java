package com.kh.ljh.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.persistence.ICompanionDao;
@Service
public class CompanionServiceImpl implements ICompanionService {
	@Inject
	private ICompanionDao companionDao;
	
	@Override
	public void insert(CompanionVo vo) throws Exception {
		companionDao.insert(vo);
		

	}

}
