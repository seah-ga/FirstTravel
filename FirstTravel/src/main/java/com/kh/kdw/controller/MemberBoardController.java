package com.kh.kdw.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.MemberBoardVo;
import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.domain.PaginationDto;
import com.kh.kdw.domain.PagingDto;
import com.kh.kdw.service.IMemberBoardService;
import com.kh.kdw.service.IMemberService;

@Controller
@RequestMapping(value="/kdw/*")
public class MemberBoardController {

	@Inject
	private IMemberBoardService memberBoardService;
	@Inject
	private IMemberService memberService;
	
	@RequestMapping(value="/board_list")
	public void totalBoardList(HttpSession session, Model model, PagingDto pagingDto) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		int user_code = memberVo.getUser_code();
		int count = memberBoardService.memberGalleryWriteCount(user_code);
		PaginationDto paginationDto = new PaginationDto();
		paginationDto.setPagingDto(pagingDto);
		paginationDto.setTotalCount(count);
		
		int startRow = pagingDto.getStartRow();
		int endRow = pagingDto.getEndRow();
		List<GBoardVo> galleryList = memberBoardService.memberGalleryWrite(user_code, startRow, endRow);
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("paginationDto", paginationDto);
		
		int boardCount = memberService.memberBoardWriteCount(user_code);
		MemberBoardVo memberBoardVo = new MemberBoardVo();
		memberBoardVo.setWriteCount(boardCount);
		model.addAttribute("memberBoardVo", memberBoardVo);
	}
}
