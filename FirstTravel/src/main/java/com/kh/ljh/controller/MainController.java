package com.kh.ljh.controller;




import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PaginationDto;
import com.kh.ljh.domain.PagingDto;
import com.kh.ljh.service.CompanionServiceImpl;
import com.kh.ljh.service.ICompanionService;





@Controller //컨트롤러에붙히는 어노테이션
@RequestMapping("/ljh/*") //요청uri주소 (메인화면컨트롤러)

public class MainController {
	@Inject
	private ICompanionService companionService;
	
	@RequestMapping(value="/main")
	public void main() {
		//System.out.println("메인화면");
}
	@RequestMapping(value="/hotel")
	public void hotel() {
		//System.out.println("호텔API정보");
}
	//동행자게시판 목록 과 글의개수
	@RequestMapping(value="/companion")
	public void companion(PagingDto pagingDto, Model model) throws Exception{
		System.out.println("MainController, list, pagingDto:" + pagingDto);
//		System.out.println("MainController, list, companionVo:" + companionVo);
		List<CompanionVo> list = companionService.list(pagingDto);
		model.addAttribute("list", list);
		PaginationDto paginationDto = new PaginationDto();
		paginationDto.setPagingDto(pagingDto);
		System.out.println(paginationDto.getPagingDto());
		//글의개수 기능만들기
		int count = companionService.listCount(pagingDto);
		paginationDto.setTotalCount(count);
		System.out.println(paginationDto.getPagingDto());
		model.addAttribute("paginationDto", paginationDto);
		
		
		
				
				
}
	
	
	
	

}
