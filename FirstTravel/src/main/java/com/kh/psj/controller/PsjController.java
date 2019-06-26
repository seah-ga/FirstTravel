package com.kh.psj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.psj.domain.CityVo;
import com.kh.psj.service.ICityService;

@Controller
@RequestMapping(value="/psj/*")
public class PsjController {
	@Inject
	ICityService cityService;
	
	@RequestMapping(value="/index")
	public void index(Model model) {
		List<CityVo> cityList = cityService.getAllCities();
		model.addAttribute("cityList", cityList);
		
		System.out.println("컨트롤러 인덱스");
	}
	@RequestMapping(value="/test")
	public void test() {
		System.out.println("컨트롤러 테스트");
	}

}
