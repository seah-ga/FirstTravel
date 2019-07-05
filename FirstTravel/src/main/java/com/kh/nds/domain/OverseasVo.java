package com.kh.nds.domain;

public class OverseasVo {
	private String overseas_Country;
	private String overseas_City;
	private String airPort;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String image6;
	private String overseas_promotioncontent;
	public OverseasVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OverseasVo(String overseas_Country, String overseas_City, String airPort, String image1, String image2,
			String image3, String image4, String image5, String image6, String overseas_promotioncontent) {
		super();
		this.overseas_Country = overseas_Country;
		this.overseas_City = overseas_City;
		this.airPort = airPort;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.image6 = image6;
		this.overseas_promotioncontent = overseas_promotioncontent;
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
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public String getImage5() {
		return image5;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public String getImage6() {
		return image6;
	}
	public void setImage6(String image6) {
		this.image6 = image6;
	}
	public String getOverseas_promotioncontent() {
		return overseas_promotioncontent;
	}
	public void setOverseas_promotioncontent(String overseas_promotioncontent) {
		this.overseas_promotioncontent = overseas_promotioncontent;
	}
	@Override
	public String toString() {
		return "OverseasVo [overseas_Country=" + overseas_Country + ", overseas_City=" + overseas_City + ", airPort="
				+ airPort + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4
				+ ", image5=" + image5 + ", image6=" + image6 + ", overseas_promotioncontent="
				+ overseas_promotioncontent + "]";
	}
	
	
	
}
