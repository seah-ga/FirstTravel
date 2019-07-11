package com.kh.psj.controller;

import java.util.List;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.psj.domain.CartVo;
import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;
import com.kh.psj.service.ICartService;
import com.kh.psj.service.ISchService;

@RestController
@RequestMapping(value="/sch")
public class ScheduleController {
	
	@Inject
	ISchService schService;
	
	@Inject
	ICartService cartService;
	
	// 스케쥴 입력
	@RequestMapping(value="/date", method=RequestMethod.POST)
	public ResponseEntity<String> insertSch(@RequestBody SchVo schVo){
		ResponseEntity<String> entity = null;
		System.out.println("schVo: " + schVo);
		try {
			schService.writeSch(schVo);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 스케쥴삭제
	@RequestMapping(value="/date", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteSch(@RequestBody SchVo schVo){
		ResponseEntity<String> entity = null;
		try {
			schService.deleteSch(schVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 스케쥴 수정
	@RequestMapping(value="/date", method=RequestMethod.PUT)
	public ResponseEntity<String> updateSch(@RequestBody SchVo schVo){
		ResponseEntity<String> entity = null;
		System.out.println("수정" +schVo);
		try {
			schService.modifySch(schVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	/// 날짜별 메인 스케쥴 입력
	@RequestMapping(value="/title", method=RequestMethod.POST)
	public ResponseEntity<String> insertSchTitle(@RequestBody SchTitleVo schTitleVo){
		ResponseEntity<String> entity = null;
		try {
			System.out.println(schTitleVo);
			schService.setSchTitle(schTitleVo);
			entity = new ResponseEntity<String>("success" , HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/title", method=RequestMethod.PUT)
	public ResponseEntity<String> updateSchTitle(@RequestBody SchTitleVo schTitleVo){
		ResponseEntity<String> entity = null;
		try {
			System.out.println(schTitleVo);
			schService.modifySchTitle(schTitleVo);
			entity = new ResponseEntity<String>("success" , HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/title", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteSchTitle(@RequestBody SchTitleVo schTitleVo){
		ResponseEntity<String> entity = null;
		try {
			System.out.println("delete : " + schTitleVo);
			schService.deleteSchTitle(schTitleVo);
			entity = new ResponseEntity<String>("success" , HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/cart", method=RequestMethod.PUT, produces = "application/json; charset=utf-8")
	public void putItemToCart(@RequestBody CartVo cartVo) {
		try {
			System.out.println(cartVo);
			cartService.putItemToCart(cartVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@RequestMapping(value="/selectByDate", method=RequestMethod.GET)
//	public ResponseEntity<JSONArray> selectSchByDate(@RequestBody SchTitleVo schTitleVo, String calMonth,String calYear){
//		ResponseEntity<JSONArray> entity = null;
//		try {
//			List<SchTitleVo> list = schService.showSchTitle(schTitleVo);
//			JSONArray schTitleJSONList = new JSONArray();
//			for(SchTitleVo titleVo : list) {
//				String voFullDate = titleVo.getSch_d_date();
//				String voYear = voFullDate.substring(0, 4);
//				String voMonth = voFullDate.substring(4, 6);
//				
//				if(calYear.equals(voYear) && calMonth.equals(voMonth)) {
//					JSONObject jsonObject = new JSONObject();
//					jsonObject.put("user_code", titleVo.getUser_code());
//					jsonObject.put("sch_d_date", titleVo.getSch_d_date());
//					jsonObject.put("sch_d_content", titleVo.getSch_d_content());
//					schTitleJSONList.put(jsonObject);
//				}
//			}
//			
//			
//			entity = new ResponseEntity<JSONArray>(schTitleJSONList, HttpStatus.OK);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
////			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//		
		
//	}
	
}
