package com.kh.nds.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nds.service.IOverseasService;
import com.kh.nds.util.OverseasFileUploadUtil;

@Controller
@RequestMapping("/ndsupload")
public class UploadController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private IOverseasService overseasService;
	
	// 여기를 통해서 파일을 불러옴
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayfile(@RequestParam("fileName") String fileName) throws Exception{
		String overseasImg = "overseasImg";
		String realPath = uploadPath + File.separator + overseasImg + File.separator + fileName;
		String formatName = OverseasFileUploadUtil.getFormatName(fileName).toUpperCase();
		
		MediaType mediaType = null;
		if (formatName.equals("JPG")) {
			mediaType = MediaType.IMAGE_JPEG;
		} else if (formatName.equals("PNG")) {
			mediaType = MediaType.IMAGE_PNG;
		} else if (formatName.equals("GIF")) {
			mediaType = MediaType.IMAGE_GIF;
		}
		
		ResponseEntity<byte[]> entity = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			boolean isImage = OverseasFileUploadUtil.isImage(formatName);
			
			if (isImage == true) {
				headers.setContentType(mediaType);
			} else {
				int underscoreIndex = fileName.lastIndexOf("_");
				String downloadName = fileName.substring(underscoreIndex + 1);
				
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-disposition", "attachment; filename=" + downloadName);	
			}
			realPath = uploadPath + File.separator + overseasImg + File.separator + fileName;
			FileInputStream is = new FileInputStream(realPath);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, 
			produces="text/plain; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		String originalName = file.getOriginalFilename();
		ResponseEntity<String> entity = null;
		try {
			// dirPath -> 2019/5/17/fb94d409-77e4-4ed1-a6b1-24253ffcf3c6_Chrysanthemum.jpg
			String dirPath = OverseasFileUploadUtil.uploadFile(uploadPath, originalName, file.getBytes());
			String path = dirPath.replace("\\", "/");
			entity = new ResponseEntity<>(path, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/display")
	public ResponseEntity<byte[]> display(@RequestParam("fileName") String fileName) throws Exception {
		// -> /2019/5/17/58d2f428-feb3-4c57-9d67-350dd294b25e_Chrysanthemum.jpg
		String realPath = uploadPath + File.separator + fileName;
		// -> H:/upload/2019/5/17/58d2f428-feb3-4c57-9d67-350dd294b25e_Chrysanthemum.jpg
		
		// 파일의 확장자 얻기
//		int dotIndex = fileName.lastIndexOf(".");
//		String extName = fileName.substring(dotIndex + 1).toUpperCase();
		String formatName = OverseasFileUploadUtil.getFormatName(fileName).toUpperCase();
		
		MediaType mediaType = null;
		if (formatName.equals("JPG")) {
			mediaType = MediaType.IMAGE_JPEG; 	// image/jpeg
		} else if (formatName.equals("PNG")) {
			mediaType = MediaType.IMAGE_PNG;	// image/png
		} else if (formatName.equals("GIF")) {
			mediaType = MediaType.IMAGE_GIF;	// image/gif
		} 
		
		ResponseEntity<byte[]> entity = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			boolean isImage = OverseasFileUploadUtil.isImage(formatName);
			
			
			if (isImage == true) {
				headers.setContentType(mediaType); // mime type 설정 : image/jpg
			} else {
				int underscoreIndex = fileName.lastIndexOf("_");
				String downloadName = fileName.substring(underscoreIndex + 1);
				// 8비트 데이터임을 명시
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-disposition", 
						"attachment; filename=" + downloadName);
			}
			realPath = uploadPath + File.separator + fileName;
			FileInputStream is = new FileInputStream(realPath);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}

	 
