package com.kh.ljh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller //컨트롤러에붙히는 어노테이션
@RequestMapping("/ljh/*") //요청uri주소

public class MainController {
	@RequestMapping(value="/main")
	public void main() {
		System.out.println("메인화면");
}
	@RequestMapping(value="/hotel")
	public void hotel() {
		System.out.println("날씨");
}
	

	
	

}
