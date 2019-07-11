package com.kh.psj.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.kdw.domain.MemberVo;

import com.kh.psj.domain.PsjPagingDto;
import com.kh.psj.domain.SearchDto;
import com.kh.psj.domain.TipRepVo;
import com.kh.psj.domain.TipUpDownVo;
import com.kh.psj.domain.TipVo;
import com.kh.psj.service.ITipRepService;
import com.kh.psj.service.ITipService;

@RestController
@RequestMapping(value="/wiki", produces = "application/json; charset=utf-8")
public class WikiController {
	
	@Inject
	ITipService tipService;
	
	@RequestMapping(value="/tip/{countryName}/{nowPage}", method=RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<TipVo>> showCountryTip(HttpSession session,@PathVariable("countryName") String countryName,
	@PathVariable("nowPage") int nowPage, SearchDto searchDto) {
		ResponseEntity<List<TipVo>> entity = null;
		try {
			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			TipUpDownVo updownVo = new TipUpDownVo();			
			int user_code = memberVo.getUser_code();
			updownVo.setUser_code(user_code);
			/// 접속 유저가 추천/비추천 했던 글 받아오기
			List<TipUpDownVo> updownList = tipService.getUpDown(updownVo);
//			System.out.println(nowPage + "ddd");
			TipVo tipVo = new TipVo();
			tipVo.setUpdownList(updownList);
			tipVo.setTip_country(countryName);
			
			System.out.println("서치디티도======" + searchDto);
			searchDto.setTip_country(countryName);
			int scriptCount = tipService.getCount(searchDto);
			// 페이징
			PsjPagingDto psjPagingDto= new PsjPagingDto(nowPage, scriptCount);
			psjPagingDto.setSearchDto(searchDto);
			System.out.println(searchDto);
			
			System.out.println(searchDto);
			tipVo.setPsjPagingDto(psjPagingDto);
			 System.out.println(" 위키컨트롤러 tipVO:" + tipVo);
			List<TipVo> tipList = tipService.showList(tipVo);
			tipList.add(tipVo);
			System.out.println(tipList);
			
			

			entity = new ResponseEntity<List<TipVo>>(tipList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<TipVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 팁 작성
	@RequestMapping(value="/tip", method=RequestMethod.PUT, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> insertCountryTip(@RequestBody TipVo tipVo){
		ResponseEntity<String> entity = null;
		try {
			System.out.println(tipVo);
			tipService.writeTip(tipVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//팁 추천, 비추천

	
	// 팁삭제
	@RequestMapping(value="/tip/{tip_no}", method=RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> deleteUpDown(@PathVariable("tip_no") int tip_no){
		ResponseEntity<String> entity = null;
		try {
			tipService.deleteTip(tip_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 팁 수정
	@RequestMapping(value="/tip/{tip_no}", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> updateTip(@PathVariable("tip_no") int tip_no,@RequestBody TipVo  tipVo){
		ResponseEntity<String> entity = null;
		try {
			tipVo.setTip_no(tip_no);
			System.out.println("modify tipVo : " + tipVo);
			tipService.modifyTip(tipVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@Inject
	ITipRepService tipRepService;
	
	@RequestMapping(value="/reply/{tip_no}", method=RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<List<TipRepVo>> getReplyList(@PathVariable("tip_no") int tip_no){
		ResponseEntity<List<TipRepVo>> entity = null;
		try {
			System.out.println("rep.get.tip_no : " + tip_no);
			List<TipRepVo> list = tipRepService.getRepList(tip_no);
			System.out.println(list);
			entity = new ResponseEntity<List<TipRepVo>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<TipRepVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/reply/{tip_no}", method=RequestMethod.PUT, produces = "application/json; charset=utf-8" )
	public ResponseEntity<String> insertReply(@PathVariable("tip_no") int tip_no, @RequestBody TipRepVo tipRepVo){
		ResponseEntity<String> entity = null;
		try {
			System.out.println(tipRepVo);
			tipRepService.writeRepList(tipRepVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/reply/{tip_rep_no}", method=RequestMethod.DELETE, produces = "application/json; charset=utf-8" )
	public ResponseEntity<String> deleteReply(@PathVariable("tip_rep_no") int tip_rep_no){
		ResponseEntity<String> entity = null;
		try {
			TipRepVo tipRepVo = new TipRepVo();
			tipRepVo.setTip_rep_no(tip_rep_no);
			tipRepService.deleteRepList(tipRepVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/reply/{tip_rep_no}", method=RequestMethod.POST, produces = "application/json; charset=utf-8" )
	public ResponseEntity<String> updateReply(@PathVariable("tip_rep_no") int tip_rep_no,  @RequestBody TipRepVo tipRepVo){
		ResponseEntity<String> entity = null;
		try {
			
			tipRepVo.setTip_rep_no(tip_rep_no);
			tipRepService.modifyRepList(tipRepVo);;
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
