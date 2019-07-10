package com.kh.kdw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;
import com.kh.kdw.persistence.IMemberBoardDao;
import com.kh.nds.domain.ReviewVo;
import com.kh.psj.domain.TipVo;
@Service
public class MemberBoardServiceImpl implements IMemberBoardService {

	@Inject
	private IMemberBoardDao memberBoardDao;
	
	@Override
	public List<GBoardVo> memberGalleryWrite(int user_code, int startRow, int endRow) throws Exception {
		// 겔러리 게시글 얻기
		List<GBoardVo> list = memberBoardDao.memberGalleryWrite(user_code, startRow, endRow);
		return list;
	}

	@Override
	public List<TipVo> memberTipWrite(int user_code, int startRow, int endRow) throws Exception {
		// 팁 게시글 얻기
		return null;
	}

	@Override
	public List<ReviewVo> memberReviewWrite(int user_code, int startRow, int endRow) throws Exception {
		// 리뷰 게시글 얻기
		return null;
	}

	@Override
	public int memberGalleryWriteCount(int user_code) throws Exception {
		// 겔러리 게시글 개수 얻기
		int count = memberBoardDao.memberGalleryWriteCount(user_code);
		return count;
	}

	@Override
	public int memberTipWriteCount(int user_code) throws Exception {
		// 팁 게시글 개수 얻기
		int count = memberBoardDao.memberTipWriteCount(user_code);
		return count;
	}

	@Override
	public int memberReviewWriteCount(int user_code) throws Exception {
		// 리뷰 게시글 개수 얻기
		int count = memberBoardDao.memberReviewWriteCount(user_code);
		return count;
	}

}
