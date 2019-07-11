package com.kh.ljh.persistence;

import java.util.List;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;
import com.kh.nds.domain.OverseasVo;

public interface ICompanionDao {
	//글쓰기 시키기 
	public void insert(CompanionVo vo) throws Exception;
	
	//글목록 만들기
	public List<CompanionVo> list(PagingDto pagingDto) throws Exception;
	
	//글의 개수만들기 
	public int listCount(PagingDto pagingDto) throws Exception;
	
	//글을 읽기 
	public CompanionVo read(int companion_numbercode) throws Exception;
	
	//글을 수정
	public void update(CompanionVo companionVo) throws Exception;
	
	//글을 삭제
	public void delete(int companion_numbercode) throws Exception;
	
	//댓글개수의 업데이트 
	public void updateReplyCount(int companion_numbercode)throws Exception;
	

}
