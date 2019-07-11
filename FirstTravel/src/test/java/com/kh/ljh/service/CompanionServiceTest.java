package com.kh.ljh.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;
import com.kh.nds.domain.OverseasVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class CompanionServiceTest {
	@Inject
	private ICompanionService companionService;
	//부모테이블에 있는정보를 자식테이블에서 입력을해야 오류가 나지않음
	@Test
	public void testInsert() throws Exception{
		CompanionVo vo = new CompanionVo();
		vo.setCompanion_title("동행자제목");
		vo.setCompanion_writer("동행자작성자");
		vo.setCompanion_content("동행자글내용");
		companionService.insert(vo);
		
	}
	@Test
	public void testList() throws Exception{
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(2);
		companionService.list(pagingDto);
	}
	@Test
	public void testListCount() throws Exception{
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(1);
		pagingDto.setPerPage(10);
		pagingDto.setSearchType("title");
		pagingDto.setKeyword("50");
		companionService.listCount(pagingDto);
		
	}
	@Test
	public void testRead() throws Exception{
		int numbercode = 4;
		companionService.read(numbercode);
	}
	@Test 
	public void testUpdate() throws Exception{
		CompanionVo companionVo = new CompanionVo();
		companionVo.setCompanion_title("제목서비스테스트");
		companionVo.setCompanion_content("내용서비스테스트");
		companionVo.setCompanion_writer("작성자서비스테스트");
		companionVo.setCompanion_numbercode(1);
		companionService.update(companionVo);
	}
	
	
	
	
		
}
