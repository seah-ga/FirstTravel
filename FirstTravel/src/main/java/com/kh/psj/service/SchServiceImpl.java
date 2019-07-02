package com.kh.psj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;
import com.kh.psj.persistence.ISchDao;

@Service
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
	public List<SchVo> showSchByDate(int user_code, String date) throws Exception {
		List<SchVo> list = schDao.selectSchByDate(user_code, date);
		return list;
		
	}

	@Override
	public List<SchVo> showAllSch(int user_code) throws Exception {
		List<SchVo> list = schDao.selectAllSch(user_code);
		return list;
		
	}

	@Override
	public void setSchTitle(SchTitleVo schTitleVo) throws Exception {
		schDao.insertSchTitle(schTitleVo);
		
	}

	@Override
	public void deleteSchTitle(SchTitleVo schTitleVo) throws Exception {
		schDao.deleteSchTitle(schTitleVo);
		
	}

	@Override
	public void modifySchTitle(SchTitleVo schTitleVo) throws Exception {
		schDao.updateSchTitle(schTitleVo);
		
	}

	@Override
	public List<SchTitleVo> showSchTitle(SchTitleVo schtitleVo) throws Exception {
		List<SchTitleVo> returnSchTitleVo = schDao.selectSchTitle(schtitleVo);
		return returnSchTitleVo;
	}

}
