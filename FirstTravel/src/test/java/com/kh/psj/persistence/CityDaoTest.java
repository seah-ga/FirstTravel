package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.psj.domain.CityVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CityDaoTest {
	@Inject
	ICityDao dao;
	
	@Test
	public void testSelectAllCity() {
		
		List<CityVo> list =  dao.getCities();
		System.out.println(list);
	}

}
