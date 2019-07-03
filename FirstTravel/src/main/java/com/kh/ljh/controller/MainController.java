package com.kh.ljh.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.service.CompanionServiceImpl;
import com.kh.ljh.service.ICompanionService;


@Controller //컨트롤러에붙히는 어노테이션
@RequestMapping("/ljh/*") //요청uri주소

public class MainController {
	@Inject
	ICompanionService companionService;
	
	@RequestMapping(value="/main")
	public void main() {
		//System.out.println("메인화면");
}
	@RequestMapping(value="/hotel")
	public void hotel() {
		//System.out.println("호텔API정보");
}
	@RequestMapping(value="/companion")
	public void companion() {
		//System.out.println("동행자구하기게시판");
	
		
	}
	//글쓰기 폼 /ljh/write (get방식)
	@RequestMapping(value="/write", method=RequestMethod.GET)
		public void write() throws Exception {
		//System.out.println("글쓰기 폼실행됨");
	}
	//글쓰기 처리 /ljh/write(post방식)
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePost(CompanionVo vo , RedirectAttributes rttr, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		System.out.println(memberVo);
		vo.setCompanion_writer(memberVo.getUser_id());
		System.out.println("MainController, writePost, vo:" + vo);
		//companionService.insert(vo);
		return "redirect:/ljh/companion";
	}
	
	
	

	
	

}
