package com.kh.psj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.psj.domain.CityVo;
import com.kh.psj.service.ICityService;

@Controller
@RequestMapping(value="/psj/*")
public class PsjController {
	@Inject
	ICityService cityService;

	//	@RequestMapping(value="/test")
//	public void test() {
//		System.out.println("컨트롤러 테스트");
//	}
	
	@RequestMapping(value="/plan")
	public void index(Model model) {
		System.out.println("컨트롤러 plan");
		try {
			List<CityVo> cityList = cityService.getAllCities();
			model.addAttribute("cityList", cityList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/schedule")
	public void schedule(@RequestParam("enterDate")String enterDate, Model model) {
		model.addAttribute("enterDate", enterDate);
	}

}
