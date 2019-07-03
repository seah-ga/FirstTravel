package com.kh.kdw.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.kdw.domain.GBoardVo;
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
	public void galleryList(PagingDto pagingDto, Model model) throws Exception {
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
		model.addAttribute("gBoardVo", gBoardVo);
	}
	
	// 겔러리 쓰기 폼
	@RequestMapping(value="/gallery_write", method=RequestMethod.GET)
	public void galleryWrite() throws Exception {
		
	}
	
	// 겔러리 쓰기 처리
	@RequestMapping(value="/gallery_write_run", method=RequestMethod.POST)
	public String galleryWriteRun(GBoardVo gBoardVo) throws Exception {
		System.out.println("gallery_write_run 실행됨");
		System.out.println("GalleryController, gallery_write_run, GBoardVo: " + gBoardVo);
		galleryService.GBoardwrite(gBoardVo);
		return "redirect:/kdw/gallery/gallery_list";
	}
	
}
