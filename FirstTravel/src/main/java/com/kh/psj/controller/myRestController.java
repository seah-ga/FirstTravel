package com.kh.psj.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/airport")
public class myRestController {
	
	@RequestMapping(value="/test", produces = "application/json; charset=utf-8")
	public String test() throws Exception {
		System.out.println("1");
	      StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
	      	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=bsFv9IdQ0FqntvU2gqvn7TJ4fjZqgKJZ2oOMf0pWAzXFNrCDXuH2zmkH25doOARoh%2BDmbBoQF8Fx%2FvdMXF6HZA%3D%3D"); /*Service Key*/
	    	
	      	urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode("NAARKJJ", "UTF-8")); /*파라미터설명*/
	        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode("NAARKPC", "UTF-8")); /*파라미터설명*/
	  
	        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode("20190620", "UTF-8")); /*파라미터설명*/
	    	System.out.println("2");
	        URL url = new URL(urlBuilder.toString());
	        System.out.println("url :" + url);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while(true) {
	        	line = rd.readLine();
	        	if (line == null) {
	        		break;
	        	}
	        	if (!line.equals("")) {
	        		sb.append(line);
	        	}
	        	
	        }
	        
	        rd.close();
	        conn.disconnect();
	        
	        
	        String result = sb.toString();
	        JSONObject resultToJson = XML.toJSONObject(result);
	        String returnData = resultToJson.toString();
	        System.out.println(result);
	        System.out.println(resultToJson);
	        
	        
//	        System.out.println("변경됨");
//	        System.out.println("returnData: " + returnData);
	        
			return returnData;
	      
	}
}
