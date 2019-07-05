package com.kh.ljh.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionVo;
import com.kh.ljh.domain.PagingDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class CompanionDaoTest {
	@Inject
	ICompanionDao companionDao;
	//글입력
	@Test
	public void testInsert() throws Exception{
		CompanionVo vo = new CompanionVo();
		vo.setCompanion_title("동행자제목");
		vo.setCompanion_writer("동행자작성자");
		vo.setCompanion_content("동행자가쓴글내용");
		companionDao.insert(vo);
		
	}
	//글목록 
	@Test
	public void testList() throws Exception{
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPage(1);
		pagingDto.setSearchType("companion_title");
		pagingDto.setKeyword("50");
		companionDao.list(pagingDto);
	}
	//글의 개수들
	@Test
	public void testListCount() throws Exception{
		PagingDto pagingDto = new PagingDto();
		pagingDto.setSearchType("companion_title");
		pagingDto.setKeyword("50");
		companionDao.listCount(pagingDto);
	}
	//글을 읽기
	@Test
	public void testRead() throws Exception{
		int numbercode = 1;
		companionDao.read(numbercode);
	}
	// 글수정(쿼리문장바꾸기테스트)
	@Test
	public void testUpdate() throws Exception{
		CompanionVo companionVo = new CompanionVo();
		companionVo.setCompanion_title("제목수정");
		companionVo.setCompanion_content("내용수정");
		companionVo.setCompanion_writer("작성자수정");
		companionVo.setCompanion_numbercode(1);
		companionDao.update(companionVo);
	}
	@Test
	public void testDelete() throws Exception{
		companionDao.delete(521);
	}
	
	

}
