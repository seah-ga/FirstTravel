package com.kh.nds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;
import com.kh.nds.domain.OverseasVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OverseasDaoTest {

	@Inject
	private IOverseasDao overseasDao;
	
	@Test
	public void listcountry() throws Exception {
		List<OverseasVo> list= overseasDao.selectAllcountry();
	}
}
