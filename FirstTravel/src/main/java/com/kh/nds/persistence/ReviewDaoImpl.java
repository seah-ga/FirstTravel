package com.kh.nds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.nds.domain.PagingDto;
import com.kh.nds.domain.ReviewVo;

@Repository
public class ReviewDaoImpl implements IReviewDao {
	
	final String NAMESPACE = "review.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReviewVo> selectAllReview(PagingDto pagingDto) throws Exception {
		List<ReviewVo> list = sqlSession.selectList(NAMESPACE + "selectAllreview", pagingDto);
		return list;
	}

	@Override
	public int reviewCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "reviewCount", pagingDto);
		return count;
	}

	@Override
	public void reviewRegist(ReviewVo reviewVo) throws Exception {
		sqlSession.insert(NAMESPACE + "reviewregist", reviewVo);
	}


}
