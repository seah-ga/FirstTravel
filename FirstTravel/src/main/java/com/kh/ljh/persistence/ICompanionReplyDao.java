package com.kh.ljh.persistence;

import java.util.List;

import com.kh.ljh.domain.CompanionReplyVo;

public interface ICompanionReplyDao {
	//댓글입력해서글쓰기 
	public void insert(CompanionReplyVo companionReplyVo) throws Exception;
	//댓글의 목록
	public List<CompanionReplyVo> list(int companion_numbercode) throws Exception;
	//댓글의 수정
	public void update(CompanionReplyVo companionReplyVo) throws Exception;
	//댓글의 삭제
	public void delete(int companion_numbercode) throws Exception;
	

}
