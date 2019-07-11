package com.kh.nds.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.kdw.domain.MemberVo;
import com.kh.nds.domain.ReviewReplyVo;
import com.kh.nds.service.IOverseasService;
import com.kh.nds.service.IReviewService;
import com.kh.psj.service.ICityService;

@RestController
@RequestMapping(value="/reviewrest")
public class ReviewRestController {

	@Inject
	private IReviewService reviewService;
	
	
	// 리뷰 댓글 작성
		@RequestMapping(value="/reviewreply-regist", method=RequestMethod.POST)
		public ResponseEntity<List<ReviewReplyVo>> reviewReplyRegist(@RequestBody ReviewReplyVo reviewReplyVo, HttpSession session) throws Exception {
			ResponseEntity<List<ReviewReplyVo>> entity = null;
			MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
			String user_id = memberVo.getUser_id();
			int user_code = memberVo.getUser_code();
			reviewReplyVo.setUser_code(user_code);
			reviewReplyVo.setReview_reply_writer(user_id);
			try {
				reviewService.replyRegist(reviewReplyVo);
				List<ReviewReplyVo> list = reviewService.replySelect(reviewReplyVo.getReview_num());
				System.out.println(list);
				entity = new ResponseEntity<List<ReviewReplyVo>>(list , HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<List<ReviewReplyVo>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		// 리뷰 댓글 삭제
		@RequestMapping(value="/reviewreply-delete", method=RequestMethod.POST)
		public ResponseEntity<List<ReviewReplyVo>> reviewReplyDelete(@RequestBody ReviewReplyVo reviewReplyVo) throws Exception {
			ResponseEntity<List<ReviewReplyVo>> entity = null;
			
			try {
				reviewService.replyDelete(reviewReplyVo.getReview_reply_num());
				List<ReviewReplyVo> list = reviewService.replySelect(reviewReplyVo.getReview_num());
				System.out.println(list);
				entity = new ResponseEntity<List<ReviewReplyVo>>(list , HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<List<ReviewReplyVo>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
}
