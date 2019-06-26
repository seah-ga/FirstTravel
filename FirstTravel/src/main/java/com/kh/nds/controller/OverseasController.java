package com.kh.nds.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.nds.domain.OverseasVo;
import com.kh.nds.service.IOverseasService;

@Controller
@RequestMapping("/nds/*")
public class OverseasController {

	@Inject
	IOverseasService overseasService;
	
	@RequestMapping(value="/itemoverseasmain", method=RequestMethod.GET)
	public void itemOverseasMain(Model model) throws Exception{
		List<OverseasVo> countrylist = overseasService.selectAllcountry();
		model.addAttribute("countrylist", countrylist);
	}
	
	@RequestMapping(value="/itemoverseasread", method=RequestMethod.GET)
	public void itemOverseasRead(OverseasVo overseasVo, Model model) throws Exception {
		List<OverseasVo> countrylist = overseasService.selectAllcountry();
		System.out.println(overseasVo);
		model.addAttribute("countrylist", countrylist);
		model.addAttribute("overseasVo", overseasVo);
	}
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public void fsafas() throws Exception {
		
	}
}

