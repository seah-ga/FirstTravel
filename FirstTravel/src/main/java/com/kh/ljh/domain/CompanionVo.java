package com.kh.ljh.domain;

import java.sql.Timestamp;

public class CompanionVo {
	private int companion_number; //유저가 쓴 글의 번호
	private int companion_usercode; //글의 유저코드
	private String companion_title; // 글의 제목
	private String companion_writer; //글의 작성자
	private String companion_content; //글의 내용
	private Timestamp companion_date; //글의 올린시간
	private int companion_reading; //글의 조회수
	public int getCompanion_number() {
		return companion_number;
	}
	public void setCompanion_number(int companion_number) {
		this.companion_number = companion_number;
	}
	public int getCompanion_usercode() {
		return companion_usercode;
	}
	public void setCompanion_usercode(int companion_usercode) {
		this.companion_usercode = companion_usercode;
	}
	public String getCompanion_title() {
		return companion_title;
	}
	public void setCompanion_title(String companion_title) {
		this.companion_title = companion_title;
	}
	public String getCompanion_writer() {
		return companion_writer;
	}
	public void setCompanion_writer(String companion_writer) {
		this.companion_writer = companion_writer;
	}
	public String getCompanion_content() {
		return companion_content;
	}
	public void setCompanion_content(String companion_content) {
		this.companion_content = companion_content;
	}
	public Timestamp getCompanion_date() {
		return companion_date;
	}
	public void setCompanion_date(Timestamp companion_date) {
		this.companion_date = companion_date;
	}
	public int getCompanion_reading() {
		return companion_reading;
	}
	public void setCompanion_reading(int companion_reading) {
		this.companion_reading = companion_reading;
	}
	@Override
	public String toString() {
		return "CompanionVo [companion_number=" + companion_number + ", companion_usercode=" + companion_usercode
				+ ", companion_title=" + companion_title + ", companion_writer=" + companion_writer
				+ ", companion_content=" + companion_content + ", companion_date=" + companion_date
				+ ", companion_reading=" + companion_reading + "]";
	}
	
	
	


}
