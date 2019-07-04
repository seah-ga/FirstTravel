package com.kh.nds.util;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class OverseasFileUploadUtil {
	
	public static String uploadFile(String uploadPath, String originalName, 
			byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		String uuidName = uuid + "_" + originalName; 
		String datePath = calcPath(uploadPath); 
		String filePath = uploadPath + File.separator + datePath + File.separator + uuidName;
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		
		String formatName = getFormatName(originalName); // 확장명 얻기
		boolean isImage = isImage(formatName); // 확장명으로 이미지여부 체크
		if (isImage) { // 이미지인 경우에
			makeThumbnail(uploadPath, datePath, uuidName); // 썸네일 이미지 생성
			makebickThumbnail(uploadPath, datePath, uuidName);
		}
		return datePath + File.separator + uuidName;
	}
	
	// 작은이미지 만들기 - 더블 버퍼링
	public static void makeThumbnail(String uploadPath, String dirPath, String uuidName) throws Exception {
		// imgscalr 라이브러리 사용
		// 원본이미지를 불러다가 메모리상에서 작은 이미지 생성
		// 메모리에 생성된 작은 이미지를 파일에 저장
		String uploadedPath = uploadPath + File.separator + dirPath + File.separator + uuidName; 
		// -> 업로드가 된 원본이미지 경로
		
		
		// 원본 이미지 파일을 메모리에 로딩
		BufferedImage sourceImg = ImageIO.read(new File(uploadedPath));
		
		// 로딩된 원본이미지를 높이값 100에 맞춰서 가로를 자동 조절
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, 
				Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		// 파일명에 s_를 붙인 이름의 파일을 생성
		// /2019/5/17/aqwef-qdfqwfa_smile.jpg
		// -> /2019/5/17/s_aqwef-qdfqwfa_smile.jpg
		String thumbnailName = uploadPath + File.separator + dirPath + File.separator 
				+ "s_" + uuidName;
		String formatName = getFormatName(uuidName);
		File target = new File(thumbnailName);
		ImageIO.write(destImg, formatName, target);
	}
	
	// 큰 섬네일
	public static void makebickThumbnail(String uploadPath, String dirPath, String uuidName) throws Exception {
		String uploadedPath = uploadPath + File.separator + dirPath + File.separator + uuidName; 
		
		// 원본 이미지 입니다.
	    BufferedImage srcImg = ImageIO.read(new File(uploadedPath));

	    // 썸네일 크기 입니다.
	    int dw = 600, dh = 400;
		
	    // 원본이미지 크기 입니다.
	    int ow = srcImg.getWidth();
	    int oh = srcImg.getHeight();
		
	    // 늘어날 길이를 계산하여 패딩합니다.
	    int pd = 0;
	    if(ow > oh) {
	 	pd = (int)(Math.abs((dh * ow / (double)dw) - oh) / 2d);
	    } else {
		pd = (int)(Math.abs((dw * oh / (double)dh) - ow) / 2d);
	    }
	    srcImg = Scalr.pad(srcImg, pd, Color.WHITE, Scalr.OP_ANTIALIAS);
		
	    // 이미지 크기가 변경되었으므로 다시 구합니다.
	    ow = srcImg.getWidth();
	    oh = srcImg.getHeight();
		
	    // 썸네일 비율로 크롭할 크기를 구합니다.
	    int nw = ow;
	    int nh = (ow * dh) / dw;
	    if(nh > oh) {
		nw = (oh * dw) / dh;
		nh = oh;
	    }
		
	    // 늘려진 이미지의 중앙을 썸네일 비율로 크롭 합니다.
	    BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		
	    // 리사이즈(썸네일 생성)
	    BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		
	    // 이미지 출력
	    String thumbnailName = uploadPath + File.separator + dirPath + File.separator 
	    		+ "b_" + uuidName;
	    File target = new File(thumbnailName);
		String formatName = getFormatName(uuidName);
		ImageIO.write(destImg, formatName, target);


	}
	
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = "" + cal.get(Calendar.YEAR); // 2019
		String monthPath = yearPath + File.separator + (cal.get(Calendar.MONTH) + 1); // /2019/
		String datePath = monthPath + File.separator + cal.get(Calendar.DATE);
		// -> 2019/5/17
		
		String dirPath = uploadPath + File.separator + datePath;
		File f = new File(dirPath);
		// -> H:/upload/2019/5/19
		// 해당 경로가 존재하지 않는다면
		if (!f.exists()) {
			f.mkdirs();
		}
		return datePath; // 2019/5/17
	}
	
	// 확장자 얻기
	public static String getFormatName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String formatName = fileName.substring(dotIndex + 1);
		return formatName;
	}
	
	// 이미지인지 여부
	public static boolean isImage(String formatName) {
		String[] imgFormat = { "JPG", "PNG", "GIF" };
		for (String aFormat : imgFormat) {
			if (formatName.toUpperCase().equals(aFormat)) {
				return true;
			}
		}
		return false;
	}
	
	public static String[] splitFileName(String fileName) {
		int slashIndex = fileName.lastIndexOf("/");
		String front = fileName.substring(0, slashIndex + 1);
		String rear = fileName.substring(slashIndex + 1);
		String[] arrStr = { front, rear };
		return arrStr;
	}
	
	public static String getThumbnailName(String fileName) {
		int slashIndex = fileName.lastIndexOf("/");
		String front = fileName.substring(0, slashIndex + 1);
		String rear = fileName.substring(slashIndex + 1);
		return front + "s_" + rear;
	}
}
