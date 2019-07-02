package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.nds.domain.PagingDto;
import com.kh.nds.domain.ReviewVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewServiceTest {

	@Inject
	private IReviewService reviewService;
	
	@Test
	public void selectAllreview() throws Exception {
		PagingDto pagingDto = new PagingDto();
		pagingDto.setPerPage(2);
		List<ReviewVo> list = reviewService.selectAllReview(pagingDto);
		System.out.println(list);
	}
	@Test
	public void reviewCount() throws Exception {
		PagingDto pagingDto = new PagingDto();
		int reviewCount = reviewService.reviewCount(pagingDto);
		System.out.println(reviewCount);
	}
	
	@Test
	public void reviewRegist() throws Exception {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReview_class("국내");
		reviewVo.setReview_country("대만");
		reviewVo.setReview_city("타이페이");
		reviewVo.setUser_code("111");
		reviewVo.setReview_content("이건 테스트의 내용");
		reviewVo.setReview_writer("first");
		reviewVo.setReview_name("fdsfsfsfs 해봅시다");
		reviewVo.setReview_image("test1.jpg");
		reviewService.reviewRegist(reviewVo);
	}
}
