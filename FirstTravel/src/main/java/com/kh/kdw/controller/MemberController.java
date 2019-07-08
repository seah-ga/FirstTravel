package com.kh.kdw.controller;


import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kdw.domain.ChkEmailVo;
import com.kh.kdw.domain.LoginDto;
import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.service.IMemberService;
import com.kh.kdw.util.TempKey;

@Controller
@RequestMapping("/kdw/*")
public class MemberController {
	
	@Inject
	private IMemberService memberService;
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) throws Exception {
		Cookie[] cookies = request.getCookies();
		String user_cookie = null;
		for (Cookie cookie : cookies) {
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			if (cookieName.equals("user_cookie")) {
				user_cookie = cookieValue;
			}
		}
		if (user_cookie != null) {
			MemberVo memberVo = memberService.memberId(Integer.parseInt(user_cookie));
			HttpSession session = request.getSession();
			session.setAttribute("memberVo", memberVo); // 동석 수정 M -> m
			return "redirect:/ljh/main";
		}
		return "/kdw/login";
	}
	
	@RequestMapping(value = "/login-run", method=RequestMethod.POST)
	public String loginRun(LoginDto loginDto, HttpSession session) throws Exception {
		System.out.println("LoginDto" + loginDto);
		MemberVo memberVo = memberService.memberLogin(loginDto.getUser_id(), loginDto.getUser_pw());
		System.out.println("memberVo" + memberVo);
		if (memberVo != null) {
			session.setAttribute("memberVo", memberVo);
			System.out.println("멤버 세션에 담김");
			return "redirect:/kdw/gallery/gallery_list";
		}
		System.out.println("멤버 세션에 담기지 않음");
		return "redirect:/kdw/join";
	}
	
	@RequestMapping(value = "/join")
	public void join() throws Exception {
		
	}
	
	@RequestMapping(value = "/join/checkid")
	@ResponseBody
	public ResponseEntity<Integer> checkId(@RequestBody MemberVo memberVo) throws Exception {
		ResponseEntity<Integer> entity = null;
		int cnt = 0;
		try {
			String userid = memberVo.getUser_id();
			cnt = memberService.checkId(userid);
			entity = new ResponseEntity<Integer>(cnt, HttpStatus.OK );
			System.out.println(cnt);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(cnt, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value= "/join/chkemail", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> ChkEmail(@RequestBody ChkEmailVo chkEmailVo) throws Exception {
		ResponseEntity<String> entity = null;
		System.out.println("/join/chkemail");
		try {
			TempKey tempKey = new TempKey();
			String key = tempKey.getKey(10, false);
			String user_email = chkEmailVo.getUser_email();
			chkEmailVo.setUser_email(user_email);
			chkEmailVo.setAuthkey(key);
			System.out.println(chkEmailVo.getUser_email());
			System.out.println(key);
			memberService.chkEmail(chkEmailVo);
			entity = new ResponseEntity<String>(key, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/join-run", method=RequestMethod.POST)
	public String joinRun(MemberVo memberVo, HttpSession session) throws Exception {
		System.out.println("memberVo1" + memberVo);
		String search_address = memberVo.getSearch_address();
		String detail_address = memberVo.getDetail_address();
		memberVo.setUser_address(search_address, detail_address);
		memberVo = memberService.memberJoin(memberVo);
		System.out.println("memberVo2" + memberVo);
		session.setAttribute("memberVo", memberVo);
		
		return "redirect:/kdw/memberinfo";
	}
	
	@RequestMapping(value="/memberinfo")
	public void memberInfo() throws Exception {
		
	}
	
	@RequestMapping(value="/memberinfo-run", method=RequestMethod.POST)
	public String memberInfoRun(MemberVo memberVo) throws Exception {
		memberService.memberModify(memberVo);
		return "redirect:/kdw/listcart";
	}
	
	
	@RequestMapping(value="/logout")
	public String loguot(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		session.invalidate();
		Cookie user_cookie = new Cookie("user_code", null);
		user_cookie.setMaxAge(0);
		response.addCookie(user_cookie);
		return "redirect:/ljh/main";
	}

	// 회원 아이디/비밀번호 찾기
	@RequestMapping(value="/search_id", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> searchId(@RequestBody MemberVo memberVo) throws Exception {
		System.out.println("회원 아이디 비번 찾기");
		System.out.println(memberVo);
		ResponseEntity<String> entity = null;
		String message = "";
		String user_id = memberVo.getUser_id();
		String user_email = memberVo.getUser_email();
		try {
			if (user_id.equals("") || user_email.equals("")) {
				message = "bad";
			}
			if (!user_id.equals("") && !user_email.equals("")) {
				message = memberService.searchId(user_id, user_email);
			}
			entity = new ResponseEntity<String>(message, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
