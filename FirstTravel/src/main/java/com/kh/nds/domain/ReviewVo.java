package com.kh.nds.domain;

import java.sql.Timestamp;

public class ReviewVo {
	private int review_num;
	private String user_code;
	private String review_class;
	private String review_country;
	private String review_city;
	private String review_name;
	private String review_content;
	private String review_image;
	private Timestamp review_date;
	private int review_reading;
	private String review_writer;
	
	public ReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public String getReview_class() {
		return review_class;
	}
	public void setReview_class(String review_class) {
		this.review_class = review_class;
	}
	public String getReview_country() {
		return review_country;
	}
	public void setReview_country(String review_country) {
		this.review_country = review_country;
	}
	public String getReview_city() {
		return review_city;
	}
	public void setReview_city(String review_city) {
		this.review_city = review_city;
	}
	public String getReview_name() {
		return review_name;
	}
	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public int getReview_reading() {
		return review_reading;
	}
	public void setReview_reading(int review_reading) {
		this.review_reading = review_reading;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public ReviewVo(int review_num, String user_code, String review_class, String review_country, String review_city,
			String review_name, String review_content, String review_image, Timestamp review_date, 
			int review_reading, String review_writer) {
		super();
		this.review_num = review_num;
		this.user_code = user_code;
		this.review_class = review_class;
		this.review_country = review_country;
		this.review_city = review_city;
		this.review_name = review_name;
		this.review_content = review_content;
		this.review_image = review_image;
		this.review_date = review_date;
		this.review_reading = review_reading;
		this.review_writer = review_writer;
	}
	@Override
	public String toString() {
		return "ReviewVo [review_num=" + review_num + ", user_code=" + user_code + ", review_class=" + review_class
				+ ", review_country=" + review_country + ", review_city=" + review_city + ", review_name=" + review_name
				+ ", review_content=" + review_content + ", review_image=" + review_image + ", review_date="
				+ review_date + ", review_reading=" + review_reading
				+ ", review_writer=" + review_writer + "]";
	}
	
}
