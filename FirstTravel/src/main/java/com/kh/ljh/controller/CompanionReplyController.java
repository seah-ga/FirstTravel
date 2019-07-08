package com.kh.ljh.controller;


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

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionReplyVo;

import com.kh.ljh.service.ICompanionReplyService;


@RestController
@RequestMapping("/companionreply")
public class CompanionReplyController {
	@Inject
	private ICompanionReplyService companionReplyService;
	
	//댓글입력
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	
	public ResponseEntity<String> insert(@RequestBody CompanionReplyVo companionReplyVo ,HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			companionReplyVo.setReply_writer(memberVo.getUser_id());
			companionReplyService.insert(companionReplyVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	//댓글 목록
	@RequestMapping(value="/list/{companion_numbercode}", method=RequestMethod.GET)
	public ResponseEntity<List<CompanionReplyVo>> list(@PathVariable("companion_numbercode") int companion_numbercode){
		ResponseEntity<List<CompanionReplyVo>> entity = null;
		try {
			List<CompanionReplyVo> list = companionReplyService.list(companion_numbercode);
			entity = new ResponseEntity<List<CompanionReplyVo>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CompanionReplyVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 댓글 수정
	// /reply/update?reply_numbercode=1 -> reply/update/1
	@RequestMapping(value="/update/{reply_numbercode}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("reply_numbercode") int reply_numbercode, 
										@RequestBody CompanionReplyVo companionReplyVo,
										HttpSession session){
		companionReplyVo.setReply_numbercode(reply_numbercode);
		ResponseEntity<String> entity = null;
		try {
			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			companionReplyVo.setReply_writer(memberVo.getUser_id());
			companionReplyService.insert(companionReplyVo);
			entity = new ResponseEntity<String> ("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> ("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//댓글삭제
	@RequestMapping(value="/delete/{reply_numbercode}/{companion_numbercode}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reply_numbercode") int reply_numbercode, @PathVariable("companion_numbercode") int companion_numbercode){
		ResponseEntity<String> entity = null;
		try {
			companionReplyService.delete(reply_numbercode, companion_numbercode);
			entity = new ResponseEntity<String> ("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> ("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
}
