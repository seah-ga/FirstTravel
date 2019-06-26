package com.kh.kdw.persistence;

import java.util.List;

import com.kh.kdw.domain.GBoardVo;

public interface IGalleryDao {
	// 글쓰기
	public void gBoardWrite(GBoardVo gBoardVo) throws Exception;
	
	// 글조회
	public GBoardVo gBoardRead(int g_no) throws Exception; 
	
	// 글수정
	public void gBoardUpdate(GBoardVo gBoardVo) throws Exception;
	
	// 글삭제
	public void gBoardDelete(int g_no) throws Exception;
	
	// 글목록
	public List<GBoardVo> gBoardList() throws Exception;
	
	// 글개수
	public int listCount() throws Exception;
	
	// 조회수 증가
	public void gViewCount(int g_no) throws Exception;
	
	// 댓글 개수 업데이트
	// 파일경로 가져오기
	// 첨부파일 삭제(파일명으로)
	// 첨부파일테이블에서 삭제(글번호로)
}
