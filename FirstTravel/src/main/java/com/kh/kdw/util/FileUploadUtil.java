package com.kh.kdw.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class FileUploadUtil {
	
	public static String uploadFile(String uploadPath, String originalFilename, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		String uuidName = uuid + "_" + originalFilename;
		String datePath = calcPath(uploadPath);
		String filePath = uploadPath + File.separator + datePath + File.separator + uuidName;
		
		FileOutputStream fos = new FileOutputStream(new File(filePath));
		FileCopyUtils.copy(fileData, fos);
		fos.close();
		
		String formatName = getFormatName(originalFilename);
		boolean isImage = isImage(formatName);
		
		if (isImage) {
			makeThumnail(uploadPath, datePath, uuidName);
		}
		
		return datePath + File.separator + uuidName;
		
	}
	
	public static String calcPath(String uploadPath) throws Exception {
		Calendar cal = Calendar.getInstance();
		String yearPath = String.valueOf(cal.get(Calendar.YEAR));
		String monthPath = yearPath + File.separator + (cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + cal.get(Calendar.DATE);
		String dirPath =  uploadPath + File.separator + datePath;
		
		System.out.println("calcPath, dirPath : " + dirPath);
		File f = new File(dirPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		return datePath;
	}
	
	// 확장자 얻기
	public static String getFormatName(String fileName) throws Exception {
		int dotIndext = fileName.lastIndexOf(".");
		String formatName = fileName.substring(dotIndext + 1);
		System.out.println("getFormatName, formatName : " + formatName);
		return formatName;
	}
	
	// 이미지 여부 체크
	public static boolean isImage(String formatName) throws Exception {
		String[] imageFormats = {"jpg", "png", "gif"};
		for (String imageFormat : imageFormats) {
			if (formatName.toLowerCase().equals(imageFormat)) {
				return true;
			}
		}
		return false;
	}
	
	// 썸네일 만들기
	public static void makeThumnail(String uploadPath, String datePath, String uuidName) throws Exception {
		String filePath = uploadPath + File.separator + datePath + File.separator + uuidName;
		System.out.println("makeThumnail, filePath : " + filePath);
		
		BufferedImage sourceImg =  ImageIO.read(new File(filePath));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String formatName = getFormatName(uuidName);
		
		String thumnailName = uploadPath + File.separator + datePath + File.separator + "s_" + uuidName;
		File target = new File(thumnailName);
		ImageIO.write(destImg, formatName, target);
		sourceImg.flush();
		destImg.flush();
		System.gc();
		System.runFinalization();
	}
	
	// 썸네일 이름 얻기
	public static String getThumnail(String fileName) throws Exception {
		int slashIndex = fileName.lastIndexOf("/");
		String front = fileName.substring(0, slashIndex + 1);
		String rear = fileName.substring(slashIndex + 1);
		String thumnailName = front + "s_" + rear;
		return thumnailName;
	}
}


