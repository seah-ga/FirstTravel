package com.kh.kdw.service;

import java.util.List;

import com.kh.kdw.domain.GBoardVo;

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
	public List<GBoardVo> GBoardList() throws Exception;
}
