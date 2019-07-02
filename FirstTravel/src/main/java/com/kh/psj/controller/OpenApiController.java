package com.kh.psj.controller;

import java.io.InputStreamReader;
import com.kh.psj.domain.HotelVo;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.kh.psj.domain.AirVo;


@RestController
@RequestMapping("/rest")
public class OpenApiController {
	/// 파싱용 메서드
	public String parsingData(StringBuilder urlBuilder) throws Exception {
		 URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	       
	        String result = sb.toString();
	        JSONObject resultToJson = XML.toJSONObject(result);
	        String returnData = resultToJson.toString();
	        return returnData;
	}
	@RequestMapping(value="/hotel-detail", produces = "application/json; charset=utf-8")
	public String getHotelDetail(HotelVo hotelVo) throws IOException {
		String hotelEntId = hotelVo.getHotelEntId();
		System.out.println("컨트롤러 호텔디테일  ID" + hotelEntId);
        StringBuilder urlBuilder = new StringBuilder("http://data.ulsan.go.kr/rest/ulsanhotel/getUlsanhotelView"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=bsFv9IdQ0FqntvU2gqvn7TJ4fjZqgKJZ2oOMf0pWAzXFNrCDXuH2zmkH25doOARoh%2BDmbBoQF8Fx%2FvdMXF6HZA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ulsanhotelEntId","UTF-8") + "=" + URLEncoder.encode(hotelEntId, "UTF-8")); /*고유번호*/
        try {
        	String returnData = parsingData(urlBuilder);
        	return returnData;
		} catch (Exception e) {
			e.printStackTrace();
		}
        return null;
	}
	
	
	@RequestMapping(value="/hotel-picture", produces = "application/json; charset=utf-8") // 호텔사진받아오기
	public String getHotelPicture(HotelVo hotelVo) throws IOException {
		String hotelEntId = hotelVo.getHotelEntId();
		System.out.println(hotelEntId);
		StringBuilder urlBuilder = new StringBuilder("http://data.ulsan.go.kr/rest/ulsanhotel/getUlsanhotelFile"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=bsFv9IdQ0FqntvU2gqvn7TJ4fjZqgKJZ2oOMf0pWAzXFNrCDXuH2zmkH25doOARoh%2BDmbBoQF8Fx%2FvdMXF6HZA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ulsanhotelEntId","UTF-8") + "=" + URLEncoder.encode(hotelEntId, "UTF-8")); /*고유번호*/
        try {
        	String returnData = parsingData(urlBuilder);
        	return returnData;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping(value="/hotel-list", produces = "application/json; charset=utf-8") // 호텔목록받기
	public String getHotel() throws IOException {
//		System.out.println("호텔목록받기");
	      StringBuilder urlBuilder = new StringBuilder("http://data.ulsan.go.kr/rest/ulsanhotel/getUlsanhotelList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=bsFv9IdQ0FqntvU2gqvn7TJ4fjZqgKJZ2oOMf0pWAzXFNrCDXuH2zmkH25doOARoh%2BDmbBoQF8Fx%2FvdMXF6HZA%3D%3D"); /*Service Key*/
//	        urlBuilder.append("&" + URLEncoder.encode("ulsanhotelTitle","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업소명*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*페이지 크기(기본10)*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*시작 페이지(기본1)*/
	        
	        try {
	        	String returnData = parsingData(urlBuilder);
	        	return returnData;
			} catch (Exception e) {
				e.printStackTrace();
			}
	        return null;
	 }
	
	@RequestMapping(value="/air-info", produces = "application/json; charset=utf-8") // 항공정보받기
	public String test(AirVo airVo) throws Exception {
		System.out.println("airVo:" + airVo);
		String depAir = airVo.getDepAirportId();
		String arrAir = airVo.getArrAirportId();
		String depDate = airVo.getDepPlandTime();
	      StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
	      	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=bsFv9IdQ0FqntvU2gqvn7TJ4fjZqgKJZ2oOMf0pWAzXFNrCDXuH2zmkH25doOARoh%2BDmbBoQF8Fx%2FvdMXF6HZA%3D%3D"); /*Service Key*/
	    	
	      	urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode(depAir, "UTF-8")); /*파라미터설명*/
	        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode(arrAir, "UTF-8")); /*파라미터설명*/
	  
	        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(depDate, "UTF-8")); /*파라미터설명*/
	        try {
	        	String returnData = parsingData(urlBuilder);
	        	return returnData;
			} catch (Exception e) {
				e.printStackTrace();
			}
	        return null;
	        
	      
	}
}
