package com.kh.kdw.persistence;

import java.util.List;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;
import com.kh.nds.domain.ReviewVo;
import com.kh.psj.domain.TipVo;

public interface IMemberBoardDao {
	// 게시글 내용 얻기
	public List<GBoardVo> memberGalleryWrite(int user_code, int startRow, int endRow) throws Exception;
	public List<TipVo> memberTipWrite(int user_code, int startRow, int endRow) throws Exception;
	public List<ReviewVo> memberReviewWrite(int user_code, int startRow, int endRow) throws Exception;
	
	// 게시글 개수 구하기
	public int memberGalleryWriteCount(int user_code) throws Exception;
	public int memberTipWriteCount(int user_code) throws Exception;
	public int memberReviewWriteCount(int user_code) throws Exception;
		
}
