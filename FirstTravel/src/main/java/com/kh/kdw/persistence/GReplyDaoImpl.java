package com.kh.kdw.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.kdw.domain.GReplyVo;

@Repository
public class GReplyDaoImpl implements IGReplyDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "reply.";

	@Override
	public void replyInsert(GReplyVo gReplyVo) throws Exception {
		// 댓글 쓰기
		sqlSession.insert(NAMESPACE + "insert", gReplyVo);

	}

	@Override
	public void replyUpdate(GReplyVo gReplyVo) throws Exception {
		// 댓글 수정
		sqlSession.update(NAMESPACE + "update", gReplyVo);
	}

	@Override
	public void replyDelete(int r_no) throws Exception {
		// 댓글 삭제
		sqlSession.delete(NAMESPACE + "delete", r_no);
	}

	@Override
	public List<GReplyVo> replyList(int g_no) throws Exception {
		// 댓글 목록
		List<GReplyVo> list = sqlSession.selectList(NAMESPACE + "replyList", g_no);
		return list;
	}

}
