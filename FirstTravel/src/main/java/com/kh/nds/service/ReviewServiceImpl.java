package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.nds.domain.PagingDto;
import com.kh.nds.domain.ReviewVo;
import com.kh.nds.persistence.IReviewDao;

@Service
public class ReviewServiceImpl implements IReviewService {

	@Inject
	private IReviewDao reviewDao; 
	
	@Override
	public List<ReviewVo> selectAllReview(PagingDto pagingDto) throws Exception {
		List<ReviewVo> list = reviewDao.selectAllReview(pagingDto);
		return list;
	}

	@Override
	public int reviewCount(PagingDto pagingDto) throws Exception {
		int count = reviewDao.reviewCount(pagingDto);
		return count;
	}

	@Override
	public void reviewRegist(ReviewVo reviewVo) throws Exception {
		reviewDao.reviewRegist(reviewVo);
	}

}
