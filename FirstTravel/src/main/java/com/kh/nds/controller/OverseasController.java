package com.kh.nds.controller;


import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.nds.domain.OverseasHotelVo;
import com.kh.nds.domain.OverseasVo;
import com.kh.nds.domain.ReviewVo;
import com.kh.nds.service.IOverseasService;
import com.kh.nds.service.IReviewService;

@Controller
@RequestMapping("/nds/*")
public class OverseasController {

	@Inject
	IOverseasService overseasService;
	
	@Inject
	IReviewService reviewService;
	@Resource(name="uploadPath")
	private String uploadPath;
	// 해외 메인화면
	@RequestMapping(value="/itemoverseasmain", method=RequestMethod.GET)
	public void itemOverseasMain(Model model) throws Exception{
		List<ReviewVo> reviewbestlist = reviewService.reviewBestList();
		List<OverseasVo> countrylist = overseasService.selectAllcountry();
		List<OverseasVo> overseas = overseasService.selectAlloverseas();
		
		model.addAttribute("countrylist", countrylist);
		model.addAttribute("overseas", overseas);
		model.addAttribute("reviewbestlist", reviewbestlist);
	}
	// 도시 상세화면
	@RequestMapping(value="/itemoverseasread", method=RequestMethod.GET)
	public void itemOverseasRead(OverseasVo overseasVo, Model model) throws Exception {
		System.out.println(overseasVo);
		List<OverseasVo> countrylist = overseasService.selectAllcountry();
		OverseasVo cityImage = overseasService.cityImage(overseasVo.getAirPort());
		overseasVo.setImage1(cityImage.getImage1());
		overseasVo.setImage2(cityImage.getImage2());
		overseasVo.setImage3(cityImage.getImage3());
		overseasVo.setImage4(cityImage.getImage4());
		overseasVo.setImage5(cityImage.getImage5());
		overseasVo.setImage6(cityImage.getImage6());
		
		
		model.addAttribute("countrylist", countrylist);
		model.addAttribute("overseasVo", overseasVo);
	}
	
}

