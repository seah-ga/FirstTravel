package com.kh.ljh.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest")
public class RestApiController {

	@RequestMapping(value="/restapi", produces= "application/json; charset=utf-8")
	public String restApi() throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://data.ulsan.go.kr/rest/ulsanhotel/getUlsanhotelView"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=HqCoyGQWpTgxXXZnKbGk62R3NY0VTv3Cco44y3d8azPpS4KHKqEv1xbxLaqJN0RxiuE3c4ZjYqVhtZheonJozg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ulsanhotelEntId","UTF-8") + "=" + URLEncoder.encode("279", "UTF-8")); /*고유번호*/
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
        System.out.println(result);
        
        return data;
    }
	
}


