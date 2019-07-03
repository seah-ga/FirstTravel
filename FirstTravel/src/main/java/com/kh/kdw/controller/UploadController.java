package com.kh.kdw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.kdw.service.IGalleryService;
import com.kh.kdw.util.FileUploadUtil;

@RestController
@RequestMapping(value="/kdw/upload/*")
public class UploadController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private IGalleryService galleryService;
	
	// produces : 출력하고자 하는 데이터 포맷을 정의 -- Accept 헤더 참고함
	// 특정 서브타입이 없는 텍스트 문서들에 대해서는 text/plain 사용(텍스트 파일의 기본값)
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="text/plain; charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		System.out.println(file);
		System.out.println(file.getOriginalFilename());
		String originalFilename = file.getOriginalFilename();
		ResponseEntity<String> entity = null;
		try {
			String dirPath = FileUploadUtil.uploadFile(uploadPath, originalFilename, file.getBytes());
			String path = dirPath.replace("\\", "/");
			entity = new ResponseEntity<String>(path, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName) throws Exception {
		String realPath = uploadPath + File.separator + fileName;
		System.out.println("dispalyFile, dirPath : " + realPath);
		
		String formatType = FileUploadUtil.getFormatName(fileName);
		MediaType mediaType = null;
		if (formatType.equals("jpg")) {
			mediaType = MediaType.IMAGE_JPEG;
		} else if (formatType.equals("gif")) {
			mediaType = MediaType.IMAGE_GIF;
		} else if (formatType.equals("png")) {
			mediaType = MediaType.IMAGE_PNG;
		}
		
		InputStream is = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			boolean isImage = FileUploadUtil.isImage(fileName);
			if (isImage) {
				is = new FileInputStream(realPath);
				headers.setContentType(mediaType);
			} else {
				int underScoreIndex = fileName.indexOf("_", 2);
				String downloadName = fileName.substring(underScoreIndex + 1);
				is = new FileInputStream(realPath);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-disposition", "attachment; filename=\"" + downloadName + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/deleteFile")
	public ResponseEntity<String> deleteFile(@RequestParam("fileName") String fileName) throws Exception {
		ResponseEntity<String> entity = null;
		String success = "success";
		String formatName = FileUploadUtil.getFormatName(fileName);
		boolean isImage = FileUploadUtil.isImage(formatName);
		System.out.println("isImage: " + isImage);
		String realPath = uploadPath + File.separator + fileName;
		try {
			File f = new File(realPath);
			System.out.println("f : " + f.exists());
			if (f.exists()) {
				while(true) {
					boolean fileDeleteStatus = f.delete();
					if (fileDeleteStatus == true) {
						System.out.println("파일 삭제됨");
						break;
					} else {
						System.out.println("파일 있음");
						Thread.sleep(200);
					}
				}
			}
			if (isImage) {
				String thumnailName = FileUploadUtil.getThumnail(fileName);
				System.out.println("thumnailName: "+ thumnailName);
				File thumnailFile = new File(uploadPath + File.separator + thumnailName);
				success = fileName;
				System.out.println("thumnailFile: "+ thumnailFile);
				if (thumnailFile.exists()) {
					
					while(true) {
						boolean thumFileDeleteStatus = thumnailFile.delete();
						if (thumFileDeleteStatus == true) {
							System.out.println("썸네일파일 삭제됨");
							break;
						} else {
							System.out.println("썸네일파일 있음");
							Thread.sleep(200);
						}
					}
				}
			}
			entity = new ResponseEntity<String>(success, HttpStatus.OK);
			System.gc();
			System.runFinalization();
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
}
