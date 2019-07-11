package com.kh.psj.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.kdw.domain.MemberVo;
import com.kh.psj.domain.TipUpDownVo;
import com.kh.psj.domain.TipVo;
import com.kh.psj.service.ITipService;

@RestController
@RequestMapping(value="/updown", produces = "application/json; charset=utf-8")
public class UpDownController {
	@Inject ITipService tipService;
	
	@RequestMapping(value="/tip/{sort}/{tip_no}/{method}", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> updateUpDown(HttpSession session,
			@PathVariable("method") String method, @PathVariable("sort") String sort, 
			@PathVariable("tip_no") int tip_no){
		ResponseEntity<String> entity = null;
		try {
			if(method.equals("plus")) {
				TipVo tipVo = new TipVo();
				tipVo.setTip_no(tip_no);
				MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
				int user_code = memberVo.getUser_code();
				tipVo.setTip_writer_code(user_code);
				TipUpDownVo tipUpDownVo = new TipUpDownVo();
				tipUpDownVo.setUser_code(user_code);
				tipUpDownVo.setTip_no(tip_no);
				tipUpDownVo.setTip_sort(sort);
				
				tipVo.setUpdownVo(tipUpDownVo);
				
				tipService.update_tipUpDown_plus(tipVo);
			}else if (method.equals("minus")) {
				TipVo tipVo = new TipVo();
				tipVo.setTip_no(tip_no);
				MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
				int user_code = memberVo.getUser_code();
				tipVo.setTip_writer_code(user_code);
				TipUpDownVo tipUpDownVo = new TipUpDownVo();
				tipUpDownVo.setUser_code(user_code);
				tipUpDownVo.setTip_no(tip_no);
				tipUpDownVo.setTip_sort(sort);
				
				tipVo.setUpdownVo(tipUpDownVo);
				
				tipService.update_tipUpDown_minus(tipVo);
				
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		
		}
		return entity;
	}
}
