package com.kh.kdw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.kdw.domain.GReplyVo;
import com.kh.kdw.persistence.IGReplyDao;
import com.kh.kdw.persistence.IGalleryDao;

@Service
public class GReplyServiceImpl implements IGReplyService {
	
	@Inject
	private IGReplyDao replyDao;
	
	@Inject
	private IGalleryDao galleryDao;

	@Transactional
	@Override
	public void replyInsert(GReplyVo gReplyVo) throws Exception {
		// 댓글 쓰기
		replyDao.replyInsert(gReplyVo);
		galleryDao.replycountUpdate(gReplyVo.getG_no());
	}

	@Override
	public void replyUpdate(GReplyVo gReplyVo) throws Exception {
		// 댓글 수정
		replyDao.replyUpdate(gReplyVo);
	}

	@Transactional
	@Override
	public void replyDelete(int r_no, int g_no) throws Exception {
		// 댓글 삭제
		replyDao.replyDelete(r_no);
		galleryDao.replycountUpdate(g_no);
	}

	@Override
	public List<GReplyVo> replyList(int g_no) throws Exception {
		// 댓글 목록
		List<GReplyVo> list = replyDao.replyList(g_no);
		return list;
	}

}
