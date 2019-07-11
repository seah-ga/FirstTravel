package com.kh.psj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.psj.domain.TipRepVo;
import com.kh.psj.persistence.ITipRepDao;

@Service
public class TipRepServiceImpl implements ITipRepService{
	@Inject
	ITipRepDao tipRepDao;

	@Override
	public List<TipRepVo> getRepList(int tip_no) throws Exception {
		List<TipRepVo> list = tipRepDao.select(tip_no);
		return list;
	}

	@Override
	public void deleteRepList(TipRepVo tipRepVo) throws Exception {
		tipRepDao.delete(tipRepVo);
		
	}

	@Override
	public void writeRepList(TipRepVo tipRepVo) throws Exception {
		tipRepDao.insert(tipRepVo);
		
	}

	@Override
	public void modifyRepList(TipRepVo tipRepVo) throws Exception {
		tipRepDao.update(tipRepVo);
		
	}
	

}
