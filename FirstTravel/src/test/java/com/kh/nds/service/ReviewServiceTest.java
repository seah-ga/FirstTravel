package com.kh.nds.service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.nds.domain.NdsPagingDto;
import com.kh.nds.domain.ReviewReplyVo;
import com.kh.nds.domain.ReviewVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewServiceTest {

	@Inject
	private IReviewService reviewService;
	
	@Test
	public void selectAllreview() throws Exception {
		NdsPagingDto pagingDto = new NdsPagingDto();
		pagingDto.setPerPage(2);
		List<ReviewVo> list = reviewService.selectAllReview(pagingDto);
		System.out.println(list);
	}
	@Test
	public void reviewCount() throws Exception {
		NdsPagingDto pagingDto = new NdsPagingDto();
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
	
	@Test
	public void reviewRead() throws Exception {
		int review_num = 634;
		ReviewVo vo = reviewService.reviewRead(review_num);
		System.out.println(vo);
	}
	
	@Test
	public void replyRegist() throws Exception {
		ReviewReplyVo vo = new ReviewReplyVo();
		vo.setReview_reply_content("서비스 테스트 입니다.");
		vo.setReview_num(629);
		vo.setUser_code(111);
		vo.setReview_reply_writer("first");
		reviewService.replyRegist(vo);
	}
	
	@Test
	public void replySelect() throws Exception {
		int review_num = 629;
		List<ReviewReplyVo> list = reviewService.replySelect(review_num);
		System.out.println(list);
	}
	
	@Test
	public void replyDelete() throws Exception {
		int review_reply_num = 103;
		reviewService.replyDelete(review_reply_num);
	}
	
	@Test
	public void reviewDelete() throws Exception {
		int review_num = 626;
		reviewService.reviewDelete(review_num);
	}
	
	@Test
	public void reviewUpdate() throws Exception {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReview_num(672);
		reviewVo.setReview_class("국내");
		reviewVo.setReview_country("대만");
		reviewVo.setReview_city("타이페이");
		reviewVo.setReview_content("이건 테스트의 내용");
		reviewVo.setReview_name("테스트를 해봅시다");
		reviewVo.setReview_image("2019/7/4/b_4ce46bbb-2e96-488a-9bf4-c77edf07ddc6_hwhw.png");
		reviewService.reviewUpdate(reviewVo);
	}
	
	@Test
	public void reviewReading() throws Exception {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReview_reading(1);
		reviewVo.setReview_num(676);
		reviewService.reviewReading(reviewVo);
	}
}
