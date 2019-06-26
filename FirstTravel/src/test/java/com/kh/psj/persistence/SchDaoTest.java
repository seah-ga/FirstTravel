package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.psj.domain.SchVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class SchDaoTest {
	
	@Inject
	ISchDao schDao;
	
	@Test
	public void insertTest() throws Exception {
		SchVo schVo = new SchVo();
		schVo.setSch_content("즐거운 울산 여행 ^^");
		schVo.setSch_date("20190626");
		schVo.setSch_time("09:00");
		schVo.setUser_code(111);
		schDao.insertSch(schVo);
	}
	
	@Test
	public void deleteTest() throws Exception {
		SchVo schVo = new SchVo();
		schVo.setSch_date("20190626");
		schVo.setSch_time("09:00");
		schVo.setUser_code(111);
		schDao.deleteSch(schVo);
	}
	
	@Test
	public void updateTest() throws Exception {
		SchVo schVo = new SchVo();
		schVo.setSch_content("수정 즐거운 울산 여행 수정수정 ^^");
		schVo.setSch_date("20190626");
		schVo.setSch_time("09:00");
		schVo.setUser_code(111);
		schDao.insertSch(schVo);
	}
	@Test
	public void selectAllTest() throws Exception {
		
		List<SchVo> list = schDao.selectAllSch(111);
		System.out.println(list);
	}
	@Test
	public void selectOneTest() throws Exception {
		SchVo schVo = new SchVo();
	
		schVo.setSch_date("20190626");
		schVo.setUser_code(111);
		SchVo returnSchVo = schDao.selectSchByDate(schVo);
		System.out.println(returnSchVo);
	}

}
