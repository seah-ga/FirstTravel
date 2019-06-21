package com.kh.nds.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.nds.domain.OverseasVo;
import com.kh.nds.service.IOverseasService;

@Controller
@RequestMapping("/nds/*")
public class OverseasController {

	@Inject
	IOverseasService overseasService;
	
	@RequestMapping(value="/itemoverseasmain", method=RequestMethod.GET)
	public void itemOverseasMain(OverseasVo overseasVo, Model model) throws Exception{
		List<OverseasVo> list = overseasService.selectAllcountry();
		model.addAttribute("list", list);
		overseasAPI();
	}
	
	@RequestMapping(value="/itemoverseaspackage", method=RequestMethod.GET)
	public void itemOverseasPackage() throws Exception {
		
	}
	
	@RequestMapping(value="/itemoverseasread", method=RequestMethod.GET)
	public void itemOverseasRead() throws Exception {
		
	}
	
	 public static void overseasAPI() throws Exception {
	        StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=w3k7Lx7kIEED3ldqaekH0bUXCCBxRnTaegHufWiTlYpv7EG9GNHoKC0yU3sDJPvBwumnOnUXMr3IRkKOozAh1g%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=4" + URLEncoder.encode("", "UTF-8")); /*인증키*/
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
	        JSONObject resultJSON = XML.toJSONObject(result);
	        String data = resultJSON.toString();
	        System.out.println(data);
	    }	
	
	
}
