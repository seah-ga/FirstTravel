package com.kh.ljh.controller;




import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PaginationDto;
import com.kh.ljh.domain.PagingDto;
import com.kh.ljh.service.CompanionServiceImpl;
import com.kh.ljh.service.ICompanionService;
import com.kh.nds.domain.OverseasVo;
import com.kh.nds.domain.ReviewVo;
import com.kh.nds.service.IOverseasService;
import com.kh.nds.service.IReviewService;





@Controller //컨트롤러에붙히는 어노테이션
@RequestMapping("/ljh/*") //요청uri주소 (메인화면컨트롤러)

public class MainController {
	@Inject
	private ICompanionService companionService;
	
	@Inject
	private IOverseasService overseasService;
	@Inject
	private IReviewService reviewService;
	
	@RequestMapping(value="/main")
	public void main(HttpSession session, Model model) throws Exception{
		//System.out.println("메인화면");
		List<ReviewVo> reviewbestlist = reviewService.reviewBestList();
		List<OverseasVo> countrylist = overseasService.selectAllcountry();
		List<OverseasVo> overseas = overseasService.selectAlloverseas();
		
		model.addAttribute("countrylist", countrylist);
		model.addAttribute("overseas", overseas);
		model.addAttribute("reviewbestlist", reviewbestlist); 
}
	@RequestMapping(value="/hotel")
	public void hotel() {
		//System.out.println("호텔API정보");
}
	//동행자게시판 목록 과 글의개수
	@RequestMapping(value="/companion")
	public void companion(PagingDto pagingDto, Model model, HttpSession session) throws Exception{
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
	// 도시 상세화면
		@RequestMapping(value="mainoverseasread", method=RequestMethod.GET)
		public String itemOverseasRead(Model model) throws Exception {
//			System.out.println(overseasVo);
			List<OverseasVo> countrylist = overseasService.selectAllcountry();
			System.out.println("contrylist, 나라목록"+ countrylist);
			List<OverseasVo> overseaslist = overseasService.selectAlloverseas();
			
			System.out.println("목록"+ overseaslist);
			
//			OverseasVo cityImage = overseasService.cityImage(overseasVo.getAirPort());
//			overseasVo.setImage1(cityImage.getImage1());
//			overseasVo.setImage2(cityImage.getImage2());
//			overseasVo.setImage3(cityImage.getImage3());
//			overseasVo.setImage4(cityImage.getImage4());
//			overseasVo.setImage5(cityImage.getImage5());
//			overseasVo.setImage6(cityImage.getImage6());
			
			
//			model.addAttribute("countrylist", countrylist);
//			model.addAttribute("overseaslist", overseaslist);
//			model.addAttribute("overseasVo", overseasVo);
			
			return "redirect:/nds/itemoverseasread?overseas_Country=${overseas_Country}&overseas_City=${overseas_City}&airport=${airport}";
			//리다이렉트 nds 오버시즈리드 ? 에어포트정보 = 값 
		}
		@RequestMapping(value="/notification", method=RequestMethod.GET)
		public String notification(HttpSession session) throws Exception{
			return "redirect:/ljh/companion";
	}		
	
	
	
	

}
