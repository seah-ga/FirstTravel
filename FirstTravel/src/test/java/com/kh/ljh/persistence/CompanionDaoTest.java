package com.kh.ljh.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;
import com.kh.ljh.domain.CompanionVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class CompanionDaoTest {
	@Inject
	ICompanionDao companionDao;
	//글입력
	@Test
	public void testInsert() throws Exception{
		CompanionVo vo = new CompanionVo();
		vo.setCompanion_usercode(111);
		vo.setCompanion_title("동행자제목");
		vo.setCompanion_writer("동행자작성자");
		vo.setCompanion_content("동행자가쓴글내용");
		companionDao.insert(vo);
		
	}
	

}
