package com.kh.ljh.service;

import java.util.List;

import com.kh.ljh.domain.CompanionReplyVo;

public interface ICompanionReplyService {

	//글을삽입하기
	public void insert(CompanionReplyVo companionReplyVo) throws Exception;
	//글의 목록 
	public List<CompanionReplyVo> list(int companion_numbercode) throws Exception;
	//글의 수정
	public void update(CompanionReplyVo companionReplyVo) throws Exception;
	//글의삭제 
	public void delete(int reply_numbercode , int companion_numbercode) throws Exception;
}
