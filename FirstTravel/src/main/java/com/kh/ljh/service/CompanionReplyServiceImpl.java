package com.kh.ljh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ljh.domain.CompanionReplyVo;
import com.kh.ljh.persistence.ICompanionDao;
import com.kh.ljh.persistence.ICompanionReplyDao;

@Service
public class CompanionReplyServiceImpl implements ICompanionReplyService {
	@Inject
	private ICompanionReplyDao companionReplyDao;
	//댓글 개수업데이트 추가하기
	@Inject
	private ICompanionDao companionDao;

	
	//2개의 crud를 사용하기위해 트랜잭션한다
	@Transactional
	@Override
	public void insert(CompanionReplyVo companionReplyVo) throws Exception {
		companionReplyDao.insert(companionReplyVo); //insert
		companionDao.updateReplyCount(companionReplyVo.getCompanion_numbercode());//update

	}


	@Override
	public List<CompanionReplyVo> list(int companion_numbercode) throws Exception {
		List<CompanionReplyVo> list = companionReplyDao.list(companion_numbercode);
		return list;
	}


	@Override
	public void update(CompanionReplyVo companionReplyVo) throws Exception {
		companionReplyDao.update(companionReplyVo);
	}

	@Transactional //2개이상의 crud여서 트랜잭션함(댓글조회수 up추가되서 댓글갱신조회수테이블만들어야함)
	@Override
	public void delete(int reply_numbercode , int companion_numbercode) throws Exception {
		companionReplyDao.delete(reply_numbercode ); //delete
		companionDao.updateReplyCount(companion_numbercode); //update
		
	}
	

}
