package com.kh.nds.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nds.domain.NdsPaginationDto;
import com.kh.nds.domain.NdsPagingDto;
import com.kh.nds.domain.ReviewReplyVo;
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
	public void reviewList(NdsPagingDto pagingDto, Model model) throws Exception {
		List<ReviewVo> reviewList = reviewService.selectAllReview(pagingDto);
		model.addAttribute("reviewList", reviewList);
		NdsPaginationDto paginationDto = new NdsPaginationDto(); 
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
	public String reviewRegistRun(ReviewVo reviewVo) throws Exception {
		// 데이터 베이스에 넣을때 이미지이름 앞에 b_ 붙혀서 빅섬네일 붙히기 리스트에 
		String reviewimage = reviewVo.getReview_image();
		int isImageindex = reviewimage.lastIndexOf(".");
		String isImagestr = reviewimage.substring(isImageindex + 1);
		System.out.println(isImagestr);
		if (isImagestr.equals("jpg") || isImagestr.equals("gif") || isImagestr.equals("png")) {
			System.out.println(reviewimage);
			int slashindex = reviewimage.lastIndexOf("/");
			String filename = reviewimage.substring(slashindex + 1);
			String front = reviewimage.substring(0 , slashindex + 1);
			String bickthumbnailName = front + "b_" + filename;
			reviewVo.setReview_image(bickthumbnailName);
		} else {
			reviewVo.setReview_image("null");
		}
			reviewService.reviewRegist(reviewVo);
		return "redirect:reviewlist";
	}
	
	// 리뷰 상세보기
	@RequestMapping(value="/reviewread", method=RequestMethod.GET)
	public void reviewread(@RequestParam("review_num") int review_num, NdsPaginationDto paginationDto, Model model) throws Exception {
		ReviewVo reviewVo = reviewService.reviewRead(review_num);
		reviewService.reviewReading(reviewVo);
		List<ReviewReplyVo> reviewReplyList = reviewService.replySelect(review_num);
		model.addAttribute("reviewVo",reviewVo);
		model.addAttribute("paginationDto",paginationDto);
		model.addAttribute("reviewReplyList", reviewReplyList);
	}
	
	// 글 삭제
	@RequestMapping(value="/reviewdelete", method=RequestMethod.GET)
	public String reviewDelete(@RequestParam("review_num") int review_num) throws Exception {
		reviewService.reviewDelete(review_num);
		
		return "redirect:reviewlist";
	}
	
	// 글 수정 폼 이동
	@RequestMapping(value="/reviewupdate", method=RequestMethod.GET)
	public void reviewUpdate(@RequestParam("review_num") int review_num, NdsPaginationDto paginationDto, Model model) throws Exception {
		ReviewVo reviewVo = reviewService.reviewRead(review_num);
		List<ReviewReplyVo> reviewReplyList = reviewService.replySelect(review_num);
		model.addAttribute("reviewVo",reviewVo);
		model.addAttribute("paginationDto",paginationDto);
		model.addAttribute("reviewReplyList", reviewReplyList);
	}
	
	@RequestMapping(value="/reviewupdate-run", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String reviewUpdateRun(ReviewVo reviewVo,Model model) throws Exception {
		// 데이터 베이스에 넣을때 이미지이름 앞에 b_ 붙혀서 빅섬네일 붙히기 리스트에 
		System.out.println(reviewVo);
		String reviewimage = reviewVo.getReview_image();
		int isImageindex = reviewimage.lastIndexOf(".");
		String isImagestr = reviewimage.substring(isImageindex + 1);
		System.out.println(isImagestr);
		if (isImagestr.equals("jpg") || isImagestr.equals("gif") || isImagestr.equals("png")) {
			System.out.println(reviewimage);
			int slashindex = reviewimage.lastIndexOf("/");
			String filename = reviewimage.substring(slashindex + 1);
			String front = reviewimage.substring(0 , slashindex + 1);
			String bickthumbnailName = front + "b_" + filename;
			reviewVo.setReview_image(bickthumbnailName);
		} else {
			reviewVo.setReview_image("null");
		}
		reviewService.reviewUpdate(reviewVo);
		model.addAttribute("review_num",reviewVo.getReview_num());
		return "redirect:reviewread";
	}
}
