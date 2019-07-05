package com.kh.nds.persistence;

import java.util.List;

import com.kh.nds.domain.NdsPagingDto;
import com.kh.nds.domain.ReviewReplyVo;
import com.kh.nds.domain.ReviewVo;

public interface IReviewDao {
	
	// 리뷰 리스트 불러오기
	public List<ReviewVo> selectAllReview(NdsPagingDto pagingDto) throws Exception;
	
	// 리뷰 리스트 갯수
	public int reviewCount(NdsPagingDto pagingDto) throws Exception;
	
	// 리뷰 글쓰기
	public void reviewRegist(ReviewVo reviewVo) throws Exception;
	
	// 리뷰 상세보기
	public ReviewVo reviewRead(int review_num) throws Exception;
	
	// 리뷰 글 삭제
	public void reviewDelete(int review_num) throws Exception;
	
	// 리뷰 글 수정
	public void reviewUpdate(ReviewVo reviewVo) throws Exception;
	
	// 리뷰 조회수
	public void reviewReading(ReviewVo reviewVo) throws Exception;

	// 리뷰 조회수에 따른 베스트 글
	public List<ReviewVo> reviewBestList() throws Exception;
	
	// 리뷰 댓글 쓰기
	public void replyRegist(ReviewReplyVo reviewReplyVo) throws Exception;
	
	// 리뷰 글번호에 따른 댓글 리스트
	public List<ReviewReplyVo> replySelect(int review_num) throws Exception; 
	
	// 리뷰 글번호에 따른 댓글 삭제
	public void replyDelete(int review_reply_num) throws Exception;
	
	
	
	
	
}