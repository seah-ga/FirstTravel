package com.kh.psj.domain;

public class CartVo {
	int cart_code;
	int user_code;
	String dep_city;
	String arr_city;
	String departure_date;
	int adult_count;
	int child_count;
	int child_price;
	int adult_price;
	
	public CartVo(int cart_code, int user_code, String dep_city, String arr_city, String departure_date,
			int adult_count, int child_count, int child_price, int adult_price) {
		super();
		this.cart_code = cart_code;
		this.user_code = user_code;
		this.dep_city = dep_city;
		this.arr_city = arr_city;
		this.departure_date = departure_date;
		this.adult_count = adult_count;
		this.child_count = child_count;
		this.child_price = child_price;
		this.adult_price = adult_price;
	}
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getDep_city() {
		return dep_city;
	}
	public void setDep_city(String dep_city) {
		this.dep_city = dep_city;
	}
	public String getArr_city() {
		return arr_city;
	}
	public void setArr_city(String arr_city) {
		this.arr_city = arr_city;
	}
	public String getDeparture_date() {
		return departure_date;
	}
	public void setDeparture_date(String departure_date) {
		this.departure_date = departure_date;
	}
	public int getAdult_count() {
		return adult_count;
	}
	public void setAdult_count(int adult_count) {
		this.adult_count = adult_count;
	}
	public int getChild_count() {
		return child_count;
	}
	public void setChild_count(int child_count) {
		this.child_count = child_count;
	}
	public int getChild_price() {
		return child_price;
	}
	public void setChild_price(int child_price) {
		this.child_price = child_price;
	}
	public int getAdult_price() {
		return adult_price;
	}
	public void setAdult_price(int adult_price) {
		this.adult_price = adult_price;
	}
	@Override
	public String toString() {
		return "CartVo [cart_code=" + cart_code + ", user_code=" + user_code + ", dep_city=" + dep_city + ", arr_city="
				+ arr_city + ", departure_date=" + departure_date + ", adult_count=" + adult_count + ", child_count="
				+ child_count + ", child_price=" + child_price + ", adult_price=" + adult_price + "]";
	}
	public CartVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
