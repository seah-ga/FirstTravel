package com.kh.kdw.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kdw.service.IMemberService;

@Controller
@RequestMapping("/kdw/*")
public class MemberController {
	
//	@Inject
//	private IMemberService memberService;
//	
	@RequestMapping(value = "/login")
	public void login() throws Exception {
		
	}
	
	@RequestMapping(value = "/login-run", method = RequestMethod.POST)
	public String loginRun() throws Exception {
		
		return "/kdw/join";
	}
	
	@RequestMapping(value = "/join")
	public void join() throws Exception {
		
	}
	
	@RequestMapping(value = "/join/checkid")
	@ResponseBody
	public ResponseEntity<String> checkId(@RequestBody String user_id ) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			entity = new ResponseEntity<String>("123", HttpStatus.OK );
			System.out.println(user_id);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

}
