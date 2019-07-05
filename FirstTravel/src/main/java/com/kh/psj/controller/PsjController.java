package com.kh.psj.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.nds.domain.OverseasVo;
import com.kh.nds.service.IOverseasService;
import com.kh.psj.domain.CityVo;
import com.kh.psj.domain.PsjPagingDto;
import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;
import com.kh.psj.domain.SearchDto;
import com.kh.psj.domain.TipVo;
import com.kh.psj.service.ICityService;
import com.kh.psj.service.ISchService;
import com.kh.psj.service.ITipService;

@Controller
@RequestMapping(value="/psj/*")
public class PsjController {
	@Inject
	ICityService cityService;
	
	@Inject
	ISchService schService;
	
	@Inject
	ITipService tipService;
	
	@Inject
	IOverseasService overseaService; // 동석씨 파일

	//	@RequestMapping(value="/test")
//	public void test() {
//		System.out.println("컨트롤러 테스트");
//	}
	
	
	@RequestMapping(value="/plan")
	public void plan(Model model) {
		System.out.println("컨트롤러 plan");
		try {
			List<CityVo> cityList = cityService.getAllCities();
			model.addAttribute("cityList", cityList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 스케쥴러로 이동
	@RequestMapping(value="/schedule")
	public void schedule(@RequestParam("enterDate")String enterDate, Model model) {
		int user_code = 111;
		try {
			SchTitleVo schtitleVo = new SchTitleVo();
			schtitleVo.setUser_code(user_code);
			List<SchVo> schList = schService.showSchByDate(user_code,enterDate); // 해당 일의 스케쥴만
			List<SchVo> allSchList = schService.showAllSch(user_code); ///  모든 스케쥴  
		
			//											데이터 베이스 테이블 자체를 title과 통합시키면 더 좋을것 같음..
			Set<String> isSchDate = new HashSet<>(); 
			for(SchVo vo : allSchList) {
				String voYear = vo.getSch_date().substring(0, 4);
				String enterYear = enterDate.substring(0, 4);
				String voMonth = vo.getSch_date().substring(4, 6);
				String enterMonth = enterDate.substring(4, 6);
				String voDay = vo.getSch_date().substring(6, 8);
				
 				if(voYear.equals(enterYear) && voMonth.equals(enterMonth)) {  // 진입 날짜와 같은 달에 스케쥴이 있는 날짜들 저장
 					isSchDate.add(voDay);
				}
			}
			model.addAttribute("isSchDate", isSchDate);
			
			
			List<SchTitleVo> schTitleList = schService.showSchTitle(schtitleVo); // 타이틀
			
			JSONArray schTitleJSONList = new JSONArray();
			for (SchTitleVo vo : schTitleList) {
				String voYear = vo.getSch_d_date().substring(0, 4);
				String enterYear = enterDate.substring(0, 4);
				String voMonth = vo.getSch_d_date().substring(4, 6);
				String enterMonth = enterDate.substring(4, 6);
				
				//enterDate의 연/월이 같은 title 정보만 json으로 변환해 넘김
				if(voYear.equals(enterYear) && voMonth.equals(enterMonth)) { 
//					System.out.println("if문 실행ㄴ");
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("user_code", vo.getUser_code());
					jsonObject.put("sch_d_date", vo.getSch_d_date());
					jsonObject.put("sch_d_content", vo.getSch_d_content());
					schTitleJSONList.put(jsonObject);
				}
			}
			
			System.out.println(schTitleJSONList);
			model.addAttribute("enterDate", enterDate);
			model.addAttribute("schList", schList);
			model.addAttribute("schTitleList", schTitleList);
			model.addAttribute("schTitleJSONList", schTitleJSONList);
			model.addAttribute("allSchList", allSchList);
//			System.out.println("psjControler titleList: " + schTitleList);
//			System.out.println(schList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/wiki")
	public void wiki(Model model) {
		try {
			List<OverseasVo> overseaList = overseaService.selectAllcountry();
			model.addAttribute("overseaList", overseaList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	


}
