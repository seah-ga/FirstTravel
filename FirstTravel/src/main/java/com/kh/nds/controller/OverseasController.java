package com.kh.nds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/nds/*")
public class OverseasController {

	@RequestMapping(value="/itemoverseasmain", method=RequestMethod.GET)
	public void itemOverseasMain() throws Exception{
	}
	
	@RequestMapping(value="/itemoverseaspackage", method=RequestMethod.GET)
	public void itemOverseasPackage() throws Exception {
		
	}
	
	@RequestMapping(value="/itemoverseasread", method=RequestMethod.GET)
	public void itemOverseasRead() throws Exception {
		
	}
	@RequestMapping(value="../include/nds/search", method=RequestMethod.GET)
	public void search() throws Exception {
		
	}
	
}
