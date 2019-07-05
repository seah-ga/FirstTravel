package com.kh.kdw.service;

import java.util.List;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;

public interface IGalleryService {

	// 글쓰기
	public void GBoardwrite(GBoardVo gBoardVo) throws Exception;
	
	// 글조회
	public GBoardVo GBoardRead(int g_no) throws Exception;
	
	// 글수정
	public void GBoardUpdate(GBoardVo gBoardVo) throws Exception;
	
	// 글삭제
	public void GBoardDelete(int g_no) throws Exception;
	
	// 글목록
	public List<GBoardVo> GBoardList(PagingDto pagingDto) throws Exception;
	
	// 글개수 얻기
	public int totalListCount(PagingDto pagingDto) throws Exception;
	
	// 다음글 얻기
	public GBoardVo nextBoard(int g_no) throws Exception;
	
	// 이전글 얻기
	public GBoardVo prevBoard(int g_no) throws Exception;
}
