package com.kh.kdw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;
import com.kh.kdw.persistence.IGalleryDao;

@Service
public class GalleryServiceImpl implements IGalleryService {
	
	@Inject
	private IGalleryDao galleryDao;

	@Transactional
	@Override
	public void GBoardwrite(GBoardVo gBoardVo) throws Exception {
		// 글쓰기
		galleryDao.gBoardWrite(gBoardVo);
		String[] files = gBoardVo.getFiles();
		for (String file_path : files) {
			galleryDao.fileAttach(file_path);
		}
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
	public List<GBoardVo> GBoardList(PagingDto pagingDto) throws Exception {
		// 글목록
		List<GBoardVo> list = galleryDao.gBoardList(pagingDto);
		
//		for (GBoardVo gBoardVo : list) {
//			int g_no = gBoardVo.getG_no();
//			String[] path = galleryDao.getFile(g_no);
//			if (path != null) {
//				gBoardVo.setFiles(path);
//			}
//			
//		}
		return list;
	}

	@Override
	public int totalListCount(PagingDto pagingDto) throws Exception {
		// 게시글 개수 얻기
		int count = galleryDao.totalListCount(pagingDto);
		return count;
	}

	@Override
	public GBoardVo nextBoard(int g_no) throws Exception {
		// 다음글 얻기
		GBoardVo gBoardVo = galleryDao.nextBoard(g_no);
		return gBoardVo;
	}

	@Override
	public GBoardVo prevBoard(int g_no) throws Exception {
		// 이전글 얻기
		GBoardVo gBoardVo = galleryDao.prevBoard(g_no);
		return gBoardVo;
	}

}
