package com.kh.psj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/psj/*")
public class PsjController {
	
	@RequestMapping(value="/index")
	public void index() {
		System.out.println("컨트롤러 인덱스");
	}
	@RequestMapping(value="/test")
	public void test() {
		System.out.println("컨트롤러 테스트");
	}

}
