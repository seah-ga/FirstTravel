package com.kh.ljh.service;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class CompanionServiceTest {
	@Inject
	private ICompanionService companionService;
	//부모테이블에 있는정보를 자식테이블에서 입력을해야 오류가 나지않음
	@Test
	public void testInsert() throws Exception{
		CompanionVo vo = new CompanionVo();
		vo.setCompanion_usercode(111);
		vo.setCompanion_title("동행자제목3");
		vo.setCompanion_writer("동행자작성자3");
		vo.setCompanion_content("동행자글내용3");
		companionService.insert(vo);
		
	}
	
	
	
		
}
