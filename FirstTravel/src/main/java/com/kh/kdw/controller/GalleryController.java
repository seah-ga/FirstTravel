package com.kh.kdw.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.domain.PaginationDto;
import com.kh.kdw.domain.PagingDto;
import com.kh.kdw.service.IGalleryService;

@Controller
@RequestMapping(value="/kdw/gallery/*")
public class GalleryController {
	
	@Inject
	private IGalleryService galleryService;
	
	// 겔러리 목록 폼
	@RequestMapping(value="/gallery_list")
	public void galleryList(PagingDto pagingDto, Model model, HttpSession session) throws Exception {
		List<GBoardVo> list = galleryService.GBoardList(pagingDto);
		int count = galleryService.totalListCount(pagingDto);
		PaginationDto paginationDto = new PaginationDto();
		paginationDto.setPagingDto(pagingDto);
		paginationDto.setTotalCount(count);
		System.out.println("count: " + count);
		model.addAttribute("list", list);
		model.addAttribute("paginationDto", paginationDto);
		model.addAttribute("pagingDto", pagingDto);
	}
	// 겔러리 조회 폼
	@RequestMapping(value="/gallery_read")
	public void galleryRead(@RequestParam("g_no") int g_no, Model model) throws Exception {
		System.out.println("read page" + g_no);
		GBoardVo gBoardVo = galleryService.GBoardRead(g_no);
		GBoardVo prevBoardVo = galleryService.prevBoard(g_no);
		GBoardVo nextBoardVo = galleryService.nextBoard(g_no);
		System.out.println("이전글:" + prevBoardVo);
		System.out.println("다음글:" + nextBoardVo);
		model.addAttribute("gBoardVo", gBoardVo);
		model.addAttribute("prevBoardVo", prevBoardVo);
		model.addAttribute("nextBoardVo", nextBoardVo);
	}
	
	// 겔러리 쓰기 폼
	@RequestMapping(value="/gallery_write", method=RequestMethod.GET)
	public void galleryWrite() throws Exception {
		
	}
	
	// 겔러리 쓰기 처리
	@RequestMapping(value="/gallery_write_run", method=RequestMethod.POST)
	public String galleryWriteRun(GBoardVo gBoardVo, HttpSession session) throws Exception {
		System.out.println("gallery_write_run 실행됨");
		System.out.println("GalleryController, gallery_write_run, GBoardVo: " + gBoardVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		System.out.println("GalleryController, gallery_write_run, memberVo: " + memberVo);
		if(memberVo == null) {
			return "redirect:/kdw/login";
		}
		int user_code = memberVo.getUser_code();
		gBoardVo.setUser_code(user_code);
		galleryService.GBoardwrite(gBoardVo);
		return "redirect:/kdw/gallery/gallery_list";
	}
	
	// 겔러리 수정 폼
	@RequestMapping(value="/gallery_modify", method=RequestMethod.GET)
	public void galleryModify(@RequestParam("g_no") int g_no, Model model) throws Exception {
		System.out.println("gallery_modify, g_no : " + g_no);
		GBoardVo gBoardVo = galleryService.GBoardRead(g_no);
		System.out.println("GalleryController, modify, gBoardVo :" + gBoardVo);
		model.addAttribute("gBoardVo", gBoardVo);
	}
	
	// 겔러리 수정 진행
	@RequestMapping(value="gallery_modify_run")
	public String galleryModifyRun(GBoardVo gBoardVo, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		if(memberVo == null) {
			return "redirect:/kdw/login";
		}
		int user_code = memberVo.getUser_code();
		gBoardVo.setUser_code(user_code);
		System.out.println("gallery_modify_run, gBoardVo : " + gBoardVo);
		galleryService.GBoardUpdate(gBoardVo);
		return "redirect:/kdw/gallery/gallery_list";
	}
	
	// 겔러리 삭제
	@RequestMapping(value="/gallery_delete/{g_no}", method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> galleryDelete(@PathVariable("g_no") int g_no) throws Exception {
		System.out.println("gallery_delete, g_no: " + g_no);
		ResponseEntity<String> entity =null;
		try {
			galleryService.GBoardDelete(g_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
