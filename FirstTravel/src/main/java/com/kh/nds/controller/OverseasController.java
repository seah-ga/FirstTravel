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
import com.kh.nds.service.IOverseasService;

@Controller
@RequestMapping("/nds/*")
public class OverseasController {

	@Inject
	IOverseasService overseasService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	// 해외 메인화면
	@RequestMapping(value="/itemoverseasmain", method=RequestMethod.GET)
	public void itemOverseasMain(Model model) throws Exception{
		List<OverseasVo> countrylist = overseasService.selectAllcountry();
		model.addAttribute("countrylist", countrylist);
	}
	// 도시 상세화면
	@RequestMapping(value="/itemoverseasread", method=RequestMethod.GET)
	public void itemOverseasRead(OverseasVo overseasVo, Model model) throws Exception {
		
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

