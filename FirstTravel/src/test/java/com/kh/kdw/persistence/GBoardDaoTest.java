package com.kh.kdw.persistence;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.GBoardVo;
import com.kh.kdw.domain.PagingDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class GBoardDaoTest {
	
	@Inject
	private IGalleryDao galleryDao;
	
	@Test
	public void gBoardWriteTest() throws Exception {
		GBoardVo gBoardVo = new GBoardVo();
		gBoardVo.setG_title("제목3");
		gBoardVo.setG_location("미국");
		gBoardVo.setG_content("여행기록2");
		gBoardVo.setG_writer("작성자2");
		gBoardVo.setG_file_path("12");
		galleryDao.gBoardWrite(gBoardVo);
		System.out.println(gBoardVo);
	}
	
	@Test
	public void GBoardReadTest() throws Exception {
		GBoardVo gBoardVo = galleryDao.gBoardRead(3);
		galleryDao.gViewCount(3);
		System.out.println(gBoardVo);
	}
	
	@Test
	public void GBoardUpdate() throws Exception {
		GBoardVo gBoardVo = new GBoardVo();
		gBoardVo.setG_title("제목1-1");
		gBoardVo.setG_location("미국");
		gBoardVo.setG_content("여행기록1-1");
		gBoardVo.setG_file_path("121");
		gBoardVo.setG_no(2);
		galleryDao.gBoardUpdate(gBoardVo);
		System.out.println(gBoardVo);
	}
	
	@Test
	public void GBoardDelete() throws Exception {
		galleryDao.gBoardDelete(2);
	}
	
	@Test
	public void gBoardList() throws Exception {
		PagingDto pagingDto = new PagingDto();
		List<GBoardVo> list = galleryDao.gBoardList(pagingDto);
		System.out.println(list);
	}
	
	@Test
	public void totalListCountTest() throws Exception {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setSearchType("title");
		pagingDto.setKeyword("1");
		int count = galleryDao.totalListCount(pagingDto);
		System.out.println(count);
	}
}
