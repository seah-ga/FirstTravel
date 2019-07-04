package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.nds.domain.NdsPagingDto;
import com.kh.nds.domain.ReviewReplyVo;
import com.kh.nds.domain.ReviewVo;
import com.kh.nds.persistence.IReviewDao;

@Service
public class ReviewServiceImpl implements IReviewService {

	@Inject
	private IReviewDao reviewDao; 
	
	@Override
	public List<ReviewVo> selectAllReview(NdsPagingDto pagingDto) throws Exception {
		List<ReviewVo> list = reviewDao.selectAllReview(pagingDto);
		return list;
	}

	@Override
	public int reviewCount(NdsPagingDto pagingDto) throws Exception {
		int count = reviewDao.reviewCount(pagingDto);
		return count;
	}

	@Override
	public void reviewRegist(ReviewVo reviewVo) throws Exception {
		reviewDao.reviewRegist(reviewVo);
	}

	@Override
	public ReviewVo reviewRead(int review_num) throws Exception {
		ReviewVo vo = reviewDao.reviewRead(review_num);
		return vo;
	}

	@Override
	public void replyRegist(ReviewReplyVo reviewReplyVo) throws Exception {
		reviewDao.replyRegist(reviewReplyVo);
	}

	@Override
	public List<ReviewReplyVo> replySelect(int review_num) throws Exception {
		List<ReviewReplyVo> list = reviewDao.replySelect(review_num);
		return list;
	}

	@Override
	public void replyDelete(int review_reply_num) throws Exception {
		reviewDao.replyDelete(review_reply_num);
	}

	@Override
	public void reviewDelete(int review_num) throws Exception {
		reviewDao.reviewDelete(review_num);
	}

	@Override
	public void reviewUpdate(ReviewVo reviewVo) throws Exception {
		reviewDao.reviewUpdate(reviewVo);
	}

	@Override
	public void reviewReading(ReviewVo reviewVo) throws Exception {
		reviewDao.reviewReading(reviewVo);
	}

}
