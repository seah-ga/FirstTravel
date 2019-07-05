package com.kh.nds.persistence;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;
import com.kh.nds.domain.OverseasHotelVo;
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
	@Test
	public void countryChk() throws Exception {
		String overseas_Country = "미국";
		List<OverseasVo> list= overseasDao.countryChk(overseas_Country);
		System.out.println(list + "리스트를 보자꾸나");
	}
	@Test
	public void selectHotel() throws Exception {
		String hotel_date = "2019-06-25";
		String hotel_city = "타이페이";
		OverseasHotelVo vo = new OverseasHotelVo();
		vo.setHotel_date(hotel_date);
		vo.setHotel_city(hotel_city);
		List<OverseasHotelVo> list = overseasDao.selectHotel(vo);
		System.out.println(list + "리스트를 보자꾸나");
	}
	@Test
	public void cityImage() throws Exception {
		String airPort = "KXK";
		OverseasVo vo = overseasDao.cityImage(airPort);
		System.out.println(vo + "리스트를 보자꾸나");
	}
	
	@Test
	public void selectAlloverseas() throws Exception {
		List<OverseasVo> list = overseasDao.selectAlloverseas();
		System.out.println(list);
	}
}
