package com.kh.nds.persistence;

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
public class ReviewDaoTest {
	
	@Inject
	private IReviewDao reviewDao;
	
	@Test
	public void selectAllReviewTest() throws Exception {
		NdsPagingDto pagingDto = new NdsPagingDto();
		List<ReviewVo> list = reviewDao.selectAllReview(pagingDto);
		System.out.println(list);
	}
	@Test
	public void reviewCountTest() throws Exception {
		NdsPagingDto pagingDto = new NdsPagingDto();
		pagingDto.setSearchType("review_city");
		pagingDto.setKeyword("ge");
		pagingDto.setPerPage(3);
		pagingDto.setPage(1);
		pagingDto.setStartRow(1);
		
		int count = reviewDao.reviewCount(pagingDto);
		System.out.println(count);
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
		reviewVo.setReview_name("테스트를 해봅시다");
		reviewVo.setReview_image("test1.jpg");
		reviewDao.reviewRegist(reviewVo);
	}
	
	@Test
	public void reviewRead() throws Exception {
		int review_num = 629;
		ReviewVo vo = reviewDao.reviewRead(review_num);
		System.out.println(vo);
	}
	
	@Test
	public void replyRegist() throws Exception {
		ReviewReplyVo vo = new ReviewReplyVo();
		vo.setReview_reply_content("안녕하세요");
		vo.setReview_num(629);
		vo.setUser_code(111);
		vo.setReview_reply_writer("first");
		reviewDao.replyRegist(vo);
	}
	
	@Test
	public void replySelect() throws Exception {
		int review_num = 629;
		List<ReviewReplyVo> list = reviewDao.replySelect(review_num);
		System.out.println(list);
	}
	
	@Test
	public void replyDelete() throws Exception {
		int review_reply_num = 104;
		reviewDao.replyDelete(review_reply_num);
	}
	
	@Test
	public void reviewDelete() throws Exception {
		int review_num = 631;
		reviewDao.reviewDelete(review_num);
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
		reviewVo.setReview_image("test1.jpg");
		reviewDao.reviewUpdate(reviewVo);
	}
	
	@Test
	public void reviewReading() throws Exception {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReview_reading(0);
		reviewVo.setReview_num(676);
		reviewDao.reviewReading(reviewVo);
	}
	
	@Test
	public void reviewBestList() throws Exception {
		List<ReviewVo> list = reviewDao.reviewBestList();
		System.out.println(list);
	}
}
