package com.kh.nds.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.kdw.domain.MemberVo;
import com.kh.nds.domain.OverseasHotelVo;
import com.kh.nds.domain.OverseasVo;
import com.kh.nds.domain.ReviewReplyVo;
import com.kh.nds.service.IOverseasService;
import com.kh.nds.service.IReviewService;
import com.kh.psj.domain.CityVo;
import com.kh.psj.service.ICityService;

@RestController
@RequestMapping(value="/overseasrest")
public class OverseasRestController {
	
	@Inject
	private IOverseasService overseasService;
	
	@Inject
	private ICityService cityService;
	
	
	// 항공 API
	@RequestMapping(value="/overseasapi", produces = "application/json; charset=utf-8")
	 public String overseasAPI(@RequestParam("airPort") String airPort,
			 				   @RequestParam("datestr") String datestr) throws Exception {
		        StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=xR1wh47zT0jWbJTg6P%2FDcu0NEy7scBcysnf1C1KGmNhtBPyxz%2FtYv3E2RLpF96wUg9M6utzOT1AdZO3M1w%2BJjg%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("schDate","UTF-8") + "=" + URLEncoder.encode(datestr, "UTF-8")); /*검색일자*/
		        urlBuilder.append("&" + URLEncoder.encode("schDeptCityCode","UTF-8") + "=" + URLEncoder.encode("GMP", "UTF-8")); /*출발 도시 코드*/
		        urlBuilder.append("&" + URLEncoder.encode("schArrvCityCode","UTF-8") + "=" + URLEncoder.encode(airPort, "UTF-8")); /*도착 도시 코드*/
		        urlBuilder.append("&" + URLEncoder.encode("schAirLine","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*항공편 코드*/
		        urlBuilder.append("&" + URLEncoder.encode("schFlightNum","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*항공편 넘버*/
		        urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*인증키*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=1" + URLEncoder.encode("", "UTF-8")); /*페이지*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
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
	
	// 국가리스트 출력
	@RequestMapping(value="/countrylist", method=RequestMethod.GET)
	public ResponseEntity<List<OverseasVo>> countryList() throws Exception {
		
		ResponseEntity<List<OverseasVo>> entity = null;
		
		try {
			 List<OverseasVo> list = overseasService.selectAllcountry();
			 entity = new ResponseEntity<List<OverseasVo>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OverseasVo>>(HttpStatus.BAD_REQUEST);
		} 
		return entity;
	}
	
	// 국가에따른 도시 출력
	@RequestMapping(value="/countrychk", method=RequestMethod.POST)
	public ResponseEntity<List<OverseasVo>> countryChk(@RequestBody OverseasVo vo) throws Exception {
		System.out.println("OverseasVo" + vo);
		
		ResponseEntity<List<OverseasVo>> entity = null;
		
		try {
			String country = vo.getOverseas_Country();
			List<OverseasVo> list = overseasService.countryChk(country);
			entity = new ResponseEntity<List<OverseasVo>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OverseasVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 한국 도시 출력
	@RequestMapping(value="/domesticlist", method=RequestMethod.GET)
	public ResponseEntity<List<CityVo>> domesticList() throws Exception {
		
		ResponseEntity<List<CityVo>> entity = null;
		
		try {
			List<CityVo> list = cityService.getAllCities();
			entity = new ResponseEntity<List<CityVo>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CityVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 데이터베이스에있는 도시,날짜에 따른 호텔출력
	@RequestMapping(value="/selecthotel", method=RequestMethod.POST)
	public ResponseEntity<List<OverseasHotelVo>> selectHotel(@RequestBody OverseasHotelVo vo) throws Exception {
		
		ResponseEntity<List<OverseasHotelVo>> entity = null;
		
		try {
			List<OverseasHotelVo> list = overseasService.selectHotel(vo);
			entity = new ResponseEntity<List<OverseasHotelVo>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OverseasHotelVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}