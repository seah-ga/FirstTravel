package com.kh.kdw.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.kdw.domain.GReplyVo;
import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.service.IGReplyService;
import com.sun.mail.iap.Response;

@RestController
@RequestMapping(value="/kdw/reply/*")
public class KdwReplyController {
	
	@Inject
	private IGReplyService replyService;

	// 댓글 쓰기
	@RequestMapping(value="/reply_insert", method=RequestMethod.POST)
	public ResponseEntity<String> replyInsert(@RequestBody GReplyVo gReplyVo, HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		String returnMessage = "";
		try {
			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			if (memberVo != null) {
				String user_name = memberVo.getUser_name();
				int user_code = memberVo.getUser_code();
				gReplyVo.setR_replyer(user_name);
				gReplyVo.setUser_code(user_code);
				replyService.replyInsert(gReplyVo);
				returnMessage = "members";
			} else {
				returnMessage = "non-members";
			}
			entity = new ResponseEntity<String>(returnMessage, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 목록
	@RequestMapping(value="/reply_list/{g_no}", method=RequestMethod.GET)
	public ResponseEntity<List<GReplyVo>> replyList(@PathVariable int g_no) throws Exception {
		System.out.println("g_no : " + g_no);
		ResponseEntity<List<GReplyVo>> entity = null;
		try {
			List<GReplyVo> list = replyService.replyList(g_no);
			entity = new ResponseEntity<List<GReplyVo>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<GReplyVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 삭제
	@RequestMapping(value="/reply_delete/{r_no}/{g_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable int r_no, @PathVariable int g_no) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			replyService.replyDelete(r_no, g_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 수정
	@RequestMapping(value="/reply_update")
	public ResponseEntity<String> replyModify() throws Exception{
		return null;
	}
}
