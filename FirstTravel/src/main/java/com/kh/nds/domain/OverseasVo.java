package com.kh.nds.domain;

public class OverseasVo {
	private String overseas_Country;
	private String overseas_City;
	private String airPort;
	
	
	public OverseasVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OverseasVo(String overseas_Country, String overseas_City, String airPort) {
		super();
		this.overseas_Country = overseas_Country;
		this.overseas_City = overseas_City;
		this.airPort = airPort;
	}
	public String getOverseas_Country() {
		return overseas_Country;
	}
	public void setOverseas_Country(String overseas_Country) {
		this.overseas_Country = overseas_Country;
	}
	public String getOverseas_City() {
		return overseas_City;
	}
	public void setOverseas_City(String overseas_City) {
		this.overseas_City = overseas_City;
	}
	public String getAirPort() {
		return airPort;
	}
	public void setAirPort(String airPort) {
		this.airPort = airPort;
	}
	
	@Override
	public String toString() {
		return "OverseasVo [overseas_Country=" + overseas_Country + ", overseas_City=" + overseas_City + ", airPort="
				+ airPort + "]";
	}
	
	
}
