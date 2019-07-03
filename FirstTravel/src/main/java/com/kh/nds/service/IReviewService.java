package com.kh.nds.service;

import java.util.List;

import com.kh.nds.domain.PagingDto;
import com.kh.nds.domain.ReviewVo;

public interface IReviewService {

	// 리뷰 리스트 불러오기
	public List<ReviewVo> selectAllReview(PagingDto pagingDto) throws Exception;
	
	// 리뷰 리스트 갯수
	public int reviewCount(PagingDto pagingDto) throws Exception;
	
	// 리뷰 글쓰기
	public void reviewRegist(ReviewVo reviewVo) throws Exception;
}
