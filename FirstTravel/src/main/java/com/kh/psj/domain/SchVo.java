package com.kh.psj.domain;

public class SchVo {
	private int user_code;
	private String sch_date;
	private String sch_time;
	private String sch_content;
	
	@Override
	public String toString() {
		return "SchVo [user_code=" + user_code + ", sch_date=" + sch_date + ", sch_time=" + sch_time + ", sch_content="
				+ sch_content + "]";
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getSch_date() {
		return sch_date;
	}
	public void setSch_date(String sch_date) {
		this.sch_date = sch_date;
	}
	public String getSch_time() {
		return sch_time;
	}
	public void setSch_time(String sch_time) {
		this.sch_time = sch_time;
	}
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	public SchVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SchVo(int user_code, String sch_date, String sch_time, String sch_content) {
		super();
		this.user_code = user_code;
		this.sch_date = sch_date;
		this.sch_time = sch_time;
		this.sch_content = sch_content;
	}
	
	

}
