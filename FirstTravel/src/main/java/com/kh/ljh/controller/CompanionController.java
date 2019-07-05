package com.kh.ljh.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;
import com.kh.ljh.service.ICompanionService;

@Controller
@RequestMapping(value="/ljh/companion/*")//동행자게시판 컨트롤러
public class CompanionController {
	@Inject
	 private ICompanionService companionService;
	
	//글쓰기 폼 /ljh/write (get방식)
		@RequestMapping(value="/write", method=RequestMethod.GET)
			public void write() throws Exception {
			//System.out.println("글쓰기 폼실행됨");
		}
		//글쓰기 처리 /ljh/write(post방식)// 로그인을해놔야함
		@RequestMapping(value="/write", method=RequestMethod.POST)
		public String writePost(CompanionVo vo , RedirectAttributes rttr, HttpSession session) throws Exception {
			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			//System.out.println(memberVo);
			vo.setCompanion_writer(memberVo.getUser_id());
			//System.out.println("MainController, writePost, vo:" + vo);
			//last (하고난후 db에 테스트)
			companionService.insert(vo);
			rttr.addFlashAttribute("message", "success_insert");
			return "redirect:/ljh/companion";
		}
		//회원이쓴 글읽기 (service get 모델가져오기)
		@RequestMapping(value="/read", method=RequestMethod.GET)
		public void read(@RequestParam("companion_numbercode") int numbercode, Model model) throws Exception{
				CompanionVo companionVo = companionService.read(numbercode);
				model.addAttribute("companionVo", companionVo);
		}
		
		//글 수정 폼양식(보여주는건 model필요)
		@RequestMapping(value="/update", method=RequestMethod.GET)
		public void update(@RequestParam("companion_numbercode") int numbercode, Model model) throws Exception{
			//read로 글번호를 읽고 
				CompanionVo companionVo = companionService.read(numbercode);
				System.out.println("CompanionController, updateRun, companionVo:" + companionVo);
				model.addAttribute("companionVo" , companionVo);
			
		}
		//글 수정 처리양식 (rttr은 수정성공메시지)
		@RequestMapping(value="/update-run", method=RequestMethod.POST)
		public String updateRun(CompanionVo companionVo , RedirectAttributes rttr) throws Exception{
			companionService.update(companionVo);
			System.out.println("CompanionController, updateRun, companionVo:" + companionVo);
			rttr.addFlashAttribute("message", "success_update");
			return "redirect:/ljh/companion/read?companion_numbercode=" + companionVo.getCompanion_numbercode();
		}
		//글 삭제
		@RequestMapping(value="/delete", method=RequestMethod.GET)
		public String delete(@RequestParam("companion_numbercode")int numbercode, RedirectAttributes rttr) throws Exception{
			companionService.delete(numbercode);
			rttr.addFlashAttribute("message", "success_delete");
			return "redirect:/ljh/companion";
		}
		
		
		
		

}
