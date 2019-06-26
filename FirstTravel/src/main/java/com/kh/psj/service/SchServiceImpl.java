package com.kh.psj.service;

import javax.inject.Inject;

import com.kh.psj.domain.SchVo;
import com.kh.psj.persistence.ISchDao;

public class SchServiceImpl implements ISchService{
	@Inject
	ISchDao schDao;
	
	@Override
	public void writeSch(SchVo schVo) throws Exception {
		schDao.insertSch(schVo);
		
	}

	@Override
	public void deleteSch(SchVo schVo) throws Exception {
		schDao.deleteSch(schVo);
		
	}

	@Override
	public void modifySch(SchVo schVo) throws Exception {
		schDao.updateSch(schVo);
		
	}

	@Override
	public void showSchByDate(SchVo schVo) throws Exception {
		schDao.selectSchByDate(schVo);
		
	}

	@Override
	public void showAllSch(int user_code) throws Exception {
		schDao.selectAllSch(user_code);
		
	}

}
