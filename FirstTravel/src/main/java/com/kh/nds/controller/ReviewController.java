package com.kh.nds.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nds.domain.PaginationDto;
import com.kh.nds.domain.PagingDto;
import com.kh.nds.domain.ReviewVo;
import com.kh.nds.service.IReviewService;
import com.kh.nds.util.OverseasFileUploadUtil;

@Controller
@RequestMapping(value="/nds")
public class ReviewController {
	
	@Inject
	private IReviewService reviewService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 리뷰리스트 이동
	@RequestMapping(value="/reviewlist", method=RequestMethod.GET)
	public void reviewList(PagingDto pagingDto, Model model) throws Exception {
		List<ReviewVo> reviewList = reviewService.selectAllReview(pagingDto);
		model.addAttribute("reviewList", reviewList);
		PaginationDto paginationDto = new PaginationDto(); 
		paginationDto.setPagingDto(pagingDto);
		int count = reviewService.reviewCount(pagingDto);
		paginationDto.setTotalCount(count);
		model.addAttribute("paginationDto", paginationDto);
	}
	
	// 글쓰기 폼으로 이동
	@RequestMapping(value="/reviewregist", method=RequestMethod.GET)
	public void reviewRegist() throws Exception {
		
	}
	
	// 리뷰 글 작성
	@RequestMapping(value="/reviewregist-run", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String reviewRegistRun(ReviewVo vo) throws Exception {
		System.out.println("ㄱㄱㄱㄱㄱㄱ");
		System.out.println(vo);
		System.out.println("rrrrrrr");
		return "redirect:reviewlist";
	}
}
