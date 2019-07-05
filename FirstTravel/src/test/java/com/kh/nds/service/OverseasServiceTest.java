package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.nds.domain.OverseasHotelVo;
import com.kh.nds.domain.OverseasVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OverseasServiceTest {
	
	@Inject
	private IOverseasService overseasService;
	
	@Test
	public void listcountry() throws Exception {
		List<OverseasVo> list= overseasService.selectAllcountry();
	}
	@Test
	public void countryChk() throws Exception {
		String overseas_Country = "미국";
		List<OverseasVo> list= overseasService.countryChk(overseas_Country);
		System.out.println(list);
	}
	@Test
	public void selectHotel() throws Exception {
		String hotel_date = "2019-06-25";
		String hotel_city = "타이페이";
		OverseasHotelVo vo = new OverseasHotelVo();
		vo.setHotel_date(hotel_date);
		vo.setHotel_city(hotel_city);
		List<OverseasHotelVo> list= overseasService.selectHotel(vo);
		System.out.println(list + "리스트를 보자꾸나");
	}
	@Test
	public void cityImage() throws Exception {
		String airPort = "KXK";
		OverseasVo vo = overseasService.cityImage(airPort);
		System.out.println(vo + "리스트를 보자꾸나");
	}
	@Test
	public void selectAlloverseas() throws Exception {
		List<OverseasVo> list = overseasService.selectAlloverseas();
		System.out.println(list);
	}
}
