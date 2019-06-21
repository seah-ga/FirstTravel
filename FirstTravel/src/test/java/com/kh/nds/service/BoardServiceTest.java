package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.nds.domain.OverseasVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardServiceTest {
	
	@Inject
	private IOverseasService overseasService;
	
	@Test
	public void listcountry() throws Exception {
		List<OverseasVo> list= overseasService.selectAllcountry();
	}
}
