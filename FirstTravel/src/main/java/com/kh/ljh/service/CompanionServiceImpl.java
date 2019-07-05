package com.kh.ljh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;
import com.kh.ljh.persistence.ICompanionDao;
@Service
public class CompanionServiceImpl implements ICompanionService {
	@Inject
	private ICompanionDao companionDao;
	
	@Override
	public void insert(CompanionVo vo) throws Exception {
		companionDao.insert(vo);
		

	}

	@Override
	public List<CompanionVo> list(PagingDto pagingDto) throws Exception {
			List<CompanionVo> list =  companionDao.list(pagingDto);
		return list;
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
			int count = companionDao.listCount(pagingDto);
		return count;
	}

	@Override
	public CompanionVo read(int numbercode) throws Exception {
				CompanionVo companionVo =  companionDao.read(numbercode);
		return companionVo;
	}

	@Override
	public void update(CompanionVo companionVo) throws Exception {
			companionDao.update(companionVo);	
	}

	@Override
	public void delete(int numbercode) throws Exception {
			companionDao.delete(numbercode);
		
	}

}
