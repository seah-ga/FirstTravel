package com.kh.kdw.persistence;

import java.util.List;

import com.kh.kdw.domain.GReplyVo;

public interface IGReplyDao {
	
	// 댓글 쓰기
	public void replyInsert(GReplyVo gReplyVo) throws Exception;
	
	// 댓글 수정
	public void replyUpdate(GReplyVo gReplyVo) throws Exception;
	
	// 댓글 삭제
	public void replyDelete(int r_no) throws Exception;
	
	// 댓글 목록
	public List<GReplyVo> replyList(int g_no) throws Exception;
}
