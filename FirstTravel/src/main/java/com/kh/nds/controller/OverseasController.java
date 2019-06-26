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
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void index() throws Exception {
		
	}
	
}
