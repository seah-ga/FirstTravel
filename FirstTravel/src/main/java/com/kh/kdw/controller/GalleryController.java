package com.kh.kdw.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.service.IGalleryService;

@Controller
@RequestMapping(value="/kdw/gallery/*")
public class GalleryController {
	
	@Inject
	private IGalleryService galleryService;
	
	@RequestMapping(value="/gallery_list")
	public void galleryList(Model model) throws Exception {
		List<GBoardVo> list = galleryService.GBoardList();
		model.addAttribute("list", list);
	}
	
}
