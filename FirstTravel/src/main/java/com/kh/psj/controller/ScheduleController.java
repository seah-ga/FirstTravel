package com.kh.psj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/sch/*")
public class ScheduleController {
	
	@RequestMapping(value="insert")
	public void insertSch(){
		
	}
	
}
