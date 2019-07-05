package com.kh.ljh.service;

import java.util.List;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;

public interface ICompanionService {
	//글쓰기
	public void insert(CompanionVo vo) throws Exception;
	//글목록
	public List<CompanionVo> list(PagingDto pagingDto) throws Exception;
	//글의 개수 
	public int listCount(PagingDto pagingDto) throws Exception;
	//글을 읽기 
	public CompanionVo read(int numbercode) throws Exception;
	//글을 수정
	public void update(CompanionVo companionVo) throws Exception;
	//글을 삭제
	public void delete(int numbercode) throws Exception;

}
