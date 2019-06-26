package com.kh.kdw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.persistence.IGalleryDao;

@Service
public class GalleryServiceImpl implements IGalleryService {
	
	@Inject
	private IGalleryDao galleryDao;

	@Override
	public void GBoardwrite(GBoardVo gBoardVo) throws Exception {
		// 글쓰기
		galleryDao.gBoardWrite(gBoardVo);
	}

	@Transactional
	@Override
	public GBoardVo GBoardRead(int g_no) throws Exception {
		// 글조회
		GBoardVo gBoardVo = galleryDao.gBoardRead(g_no);
		// 조회수 업데이트
		galleryDao.gViewCount(g_no);
		return gBoardVo;
	}

	@Override
	public void GBoardUpdate(GBoardVo gBoardVo) throws Exception {
		// 글수정
		galleryDao.gBoardUpdate(gBoardVo);
	}

	@Override
	public void GBoardDelete(int g_no) throws Exception {
		// 글삭제
		galleryDao.gBoardDelete(g_no);
	}

	@Override
	public List<GBoardVo> GBoardList() throws Exception {
		// 글목록
		List<GBoardVo> list = galleryDao.gBoardList();
		return list;
	}

}
