package com.kh.kdw.persistence;

import java.util.List;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;

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
	public List<GBoardVo> gBoardList(PagingDto pagingDto) throws Exception;
	
	// 글개수
	public int totalListCount(PagingDto pagingDto) throws Exception;
	
	// 조회수 증가
	public void gViewCount(int g_no) throws Exception;
	
	// 첨부파일 위치 저장
	public void fileAttach(String file_path) throws Exception;
	
	// 첨부파일 위치 저장
	public void fileAttachModify(String file_path, int g_no) throws Exception;
	
	// 첨부파일 경로 가져오기
	public String[] getFile(int g_no) throws Exception;
	
	// 이전글 내용
	public GBoardVo prevBoard(int g_no) throws Exception;
	
	// 다음글 내용
	public GBoardVo nextBoard(int g_no) throws Exception;
	
	// 댓글 개수 업데이트
	public void replycountUpdate(int g_no) throws Exception;
	
	// 첨부파일테이블에서 삭제(글번호로)
	public void fileDelete(int g_no) throws Exception;
	// 첨부파일테이블에서 삭제(글번호로)
}
