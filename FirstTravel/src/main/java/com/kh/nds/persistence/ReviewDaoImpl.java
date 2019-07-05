package com.kh.nds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.nds.domain.NdsPagingDto;
import com.kh.nds.domain.ReviewReplyVo;
import com.kh.nds.domain.ReviewVo;

@Repository
public class ReviewDaoImpl implements IReviewDao {
	
	final String NAMESPACE = "review.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReviewVo> selectAllReview(NdsPagingDto pagingDto) throws Exception {
		List<ReviewVo> list = sqlSession.selectList(NAMESPACE + "selectAllreview", pagingDto);
		return list;
	}

	@Override
	public int reviewCount(NdsPagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "reviewCount", pagingDto);
		return count;
	}

	@Override
	public void reviewRegist(ReviewVo reviewVo) throws Exception {
		sqlSession.insert(NAMESPACE + "reviewregist", reviewVo);
	}

	@Override
	public ReviewVo reviewRead(int review_num) throws Exception {
		ReviewVo vo = sqlSession.selectOne(NAMESPACE + "reviewread", review_num);
		return vo;
	}

	@Override
	public void replyRegist(ReviewReplyVo reviewReplyVo) throws Exception {
		sqlSession.insert(NAMESPACE + "replyregist" , reviewReplyVo);
	}

	@Override
	public List<ReviewReplyVo> replySelect(int review_num) throws Exception {
		List<ReviewReplyVo> list = sqlSession.selectList(NAMESPACE + "replyselect" , review_num);
		return list;
	}

	@Override
	public void replyDelete(int review_reply_num) throws Exception {
		sqlSession.delete(NAMESPACE + "replydelete", review_reply_num);
	}

	@Override
	public void reviewDelete(int review_num) throws Exception {
		sqlSession.delete(NAMESPACE + "reviewdelete", review_num);
	}

	@Override
	public void reviewUpdate(ReviewVo reviewVo) throws Exception {
		sqlSession.update(NAMESPACE + "reviewupdate", reviewVo);
	}

	@Override
	public void reviewReading(ReviewVo reviewVo) throws Exception {
		sqlSession.update(NAMESPACE + "reviewreading", reviewVo);
	}

	@Override
	public List<ReviewVo> reviewBestList() throws Exception {
		List<ReviewVo> list = sqlSession.selectList(NAMESPACE + "reviewbestlist");
		return list;
	}


}
