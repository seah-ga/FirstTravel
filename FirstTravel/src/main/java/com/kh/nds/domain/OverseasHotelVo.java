package com.kh.nds.domain;

public class OverseasHotelVo {
	private int hotel_code;
	private String hotel_city;
	private String hotel_name;
	private String hotel_location;
	private String hotel_date;
	private int price_adult;
	private int price_child;
	private String hotel_image;
	
	
	public OverseasHotelVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getHotel_code() {
		return hotel_code;
	}
	public void setHotel_code(int hotel_code) {
		this.hotel_code = hotel_code;
	}
	public String getHotel_city() {
		return hotel_city;
	}
	public void setHotel_city(String hotel_city) {
		this.hotel_city = hotel_city;
	}
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	public String getHotel_location() {
		return hotel_location;
	}
	public void setHotel_location(String hotel_location) {
		this.hotel_location = hotel_location;
	}
	public String getHotel_date() {
		return hotel_date;
	}
	public void setHotel_date(String hotel_date) {
		this.hotel_date = hotel_date;
	}
	public int getPrice_adult() {
		return price_adult;
	}
	public void setPrice_adult(int price_adult) {
		this.price_adult = price_adult;
	}
	public int getPrice_child() {
		return price_child;
	}
	public void setPrice_child(int price_child) {
		this.price_child = price_child;
	}
	public String getHotel_image() {
		return hotel_image;
	}
	public void setHotel_image(String hotel_image) {
		this.hotel_image = hotel_image;
	}
	public OverseasHotelVo(int hotel_code, String hotel_city, String hotel_name, String hotel_location,
			String hotel_date, int price_adult, int price_child, String hotel_image) {
		super();
		this.hotel_code = hotel_code;
		this.hotel_city = hotel_city;
		this.hotel_name = hotel_name;
		this.hotel_location = hotel_location;
		this.hotel_date = hotel_date;
		this.price_adult = price_adult;
		this.price_child = price_child;
		this.hotel_image = hotel_image;
	}
	@Override
	public String toString() {
		return "OverseasHotelVo [hotel_code=" + hotel_code + ", hotel_city=" + hotel_city + ", hotel_name=" + hotel_name
				+ ", hotel_location=" + hotel_location + ", hotel_date=" + hotel_date + ", price_adult=" + price_adult
				+ ", price_child=" + price_child + ", hotel_image=" + hotel_image + "]";
	}
	
}
