package com.kh.psj.domain;

public class CityVo {
	private String domestic_city;
	private String airport;
	public CityVo(String domestic_city, String airport) {
		super();
		this.domestic_city = domestic_city;
		this.airport = airport;
	}
	public CityVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDomestic_city() {
		return domestic_city;
	}
	public void setDomestic_city(String domestic_city) {
		this.domestic_city = domestic_city;
	}
	public String getAirport() {
		return airport;
	}
	public void setAirport(String airport) {
		this.airport = airport;
	}
	

}
