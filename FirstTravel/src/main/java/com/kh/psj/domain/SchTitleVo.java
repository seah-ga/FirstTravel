package com.kh.psj.domain;

public class SchTitleVo {
	int user_code;
	String sch_d_date;
	String sch_d_content;
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getSch_d_date() {
		return sch_d_date;
	}
	public void setSch_d_date(String sch_d_date) {
		this.sch_d_date = sch_d_date;
	}
	public String getSch_d_content() {
		return sch_d_content;
	}
	public void setSch_d_content(String sch_d_content) {
		this.sch_d_content = sch_d_content;
	}
	@Override
	public String toString() {
		return "SchTitleVo [user_code=" + user_code + ", sch_d_date=" + sch_d_date + ", sch_d_content=" + sch_d_content
				+ "]";
	}
	public SchTitleVo(int user_code, String sch_d_date, String sch_d_content) {
		super();
		this.user_code = user_code;
		this.sch_d_date = sch_d_date;
		this.sch_d_content = sch_d_content;
	}
	public SchTitleVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
