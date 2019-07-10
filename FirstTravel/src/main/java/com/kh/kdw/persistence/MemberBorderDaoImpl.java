package com.kh.kdw.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.kdw.domain.GBoardVo;
import com.kh.nds.domain.ReviewVo;
import com.kh.psj.domain.TipVo;

@Repository
public class MemberBorderDaoImpl implements IMemberBoardDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "memberBoard.";

	@Override
	public List<GBoardVo> memberGalleryWrite(int user_code, int startRow, int endRow) throws Exception {
		// 겔러리게시판 게시글 내용얻기
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("user_code", user_code);
		boardMap.put("startRow", startRow);
		boardMap.put("endRow", endRow);
		List<GBoardVo> list = sqlSession.selectList(NAMESPACE + "memberGalleryWrite", boardMap);
		return list;
	}

	@Override
	public List<TipVo> memberTipWrite(int user_code, int startRow, int endRow) throws Exception {
		// 팁게시판 게시글 내용얻기
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("user_code", user_code);
		boardMap.put("startRow", startRow);
		boardMap.put("endRow", endRow);
		List<TipVo> list = sqlSession.selectList(NAMESPACE + "memberTipWrite", boardMap);
		return list;
	}

	@Override
	public List<ReviewVo> memberReviewWrite(int user_code, int startRow, int endRow) throws Exception {
		// 후기게시판 게시글 내용얻기
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("user_code", user_code);
		boardMap.put("startRow", startRow);
		boardMap.put("endRow", endRow);
		List<ReviewVo> list = sqlSession.selectList(NAMESPACE + "memberReviewWrite", boardMap);
		return list;
	}

	@Override
	public int memberGalleryWriteCount(int user_code) throws Exception {
		// 겔러리 게시판 개수
		int count = sqlSession.selectOne(NAMESPACE + "memberGalleryWriteCount", user_code);
		return count;
	}

	@Override
	public int memberTipWriteCount(int user_code) throws Exception {
		// 팁 게시판 개수
		int count = sqlSession.selectOne(NAMESPACE + "memberTipWriteCount", user_code);
		return count;
	}

	@Override
	public int memberReviewWriteCount(int user_code) throws Exception {
		// 후기게시판 개수
		int count = sqlSession.selectOne(NAMESPACE + "memberReviewWriteCount", user_code);
		return count;
	}
}
