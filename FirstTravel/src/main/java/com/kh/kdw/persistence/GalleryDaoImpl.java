package com.kh.kdw.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;

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
	public List<GBoardVo> gBoardList(PagingDto pagingDto) throws Exception {
		// 글목록
		List<GBoardVo> list = sqlSession.selectList(NAMESPACE + "gBoardList", pagingDto);
		System.out.println("dao list:" + list);
		return list;
	}

	@Override
	public int totalListCount(PagingDto pagingDto) throws Exception {
		// 글개수
		int count = sqlSession.selectOne(NAMESPACE + "totalListCount", pagingDto);
		return count;
	}

	@Override
	public void gViewCount(int g_no) throws Exception {
		// 조회수 증가
		sqlSession.update(NAMESPACE + "gViewCount", g_no);
	}

	@Override
	public void fileAttach(String file_path) throws Exception {
		// 첨부파일 위치 저장
		sqlSession.insert(NAMESPACE + "fileAttach", file_path);
		
	}

	@Override
	public String[] getFile(int g_no) throws Exception {
		// 첨부파일 경로 가져오기
		String path = sqlSession.selectOne(NAMESPACE + "getFile", g_no);
		System.out.println("path:" + path);
		return new String[] {path};
	}

	@Override
	public GBoardVo prevBoard(int g_no) throws Exception {
		// 이전글 얻기
		GBoardVo gBoardVo = sqlSession.selectOne(NAMESPACE + "go_prev", g_no);
		return gBoardVo;
	}

	@Override
	public GBoardVo nextBoard(int g_no) throws Exception {
		// 다음글 얻기
		GBoardVo gBoardVo = sqlSession.selectOne(NAMESPACE + "go_next", g_no);
		return gBoardVo;
	}

	@Override
	public void replycountUpdate(int g_no) throws Exception {
		// 답글 개수 갱신
		sqlSession.update(NAMESPACE + "replyCountUpdate", g_no);
		
	}

}
