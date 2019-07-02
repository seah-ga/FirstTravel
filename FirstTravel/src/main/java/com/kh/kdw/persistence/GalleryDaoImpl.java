package com.kh.kdw.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.kdw.domain.GBoardVo;

@Repository
public class GalleryDaoImpl implements IGalleryDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "gallery_board.";

	@Override
	public void gBoardWrite(GBoardVo gBoardVo) throws Exception {
		// 글쓰기
		sqlSession.insert(NAMESPACE + "gBoardWrite", gBoardVo);
	}

	@Override
	public GBoardVo gBoardRead(int g_no) throws Exception {
		// 글조회
		GBoardVo gBoardVo = sqlSession.selectOne(NAMESPACE + "gBoardRead", g_no);
		return gBoardVo;
	}

	@Override
	public void gBoardUpdate(GBoardVo gBoardVo) throws Exception {
		// 글수정
		sqlSession.update(NAMESPACE + "gBoardUpdate", gBoardVo);
	}

	@Override
	public void gBoardDelete(int g_no) throws Exception {
		// 글삭제
		sqlSession.delete(NAMESPACE + "gBoardDelete", g_no);
	}

	@Override
	public List<GBoardVo> gBoardList() throws Exception {
		// 글목록
		List<GBoardVo> list = sqlSession.selectList(NAMESPACE + "gBoardList");
		return list;
	}

	@Override
	public int listCount() throws Exception {
		// 글개수
		return 0;
	}

	@Override
	public void gViewCount(int g_no) throws Exception {
		// 조회수 증가
		sqlSession.update(NAMESPACE + "gViewCount", g_no);
	}

}
