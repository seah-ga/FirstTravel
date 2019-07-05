package com.kh.kdw.domain;

import java.sql.Timestamp;

public class GReplyVo {
	private int r_no;					// 겔러리 리플 번호
	private int g_no;					// 겔러리 글번호
	private String r_text;				// 리플 내용
	private String r_replyer;			// 리플 작성자
	private int user_code;				// 작성자 멤버 코드
	private Timestamp r_regdate;		// 작성일
	private Timestamp r_update_date;	// 수정일
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getR_text() {
		return r_text;
	}
	public void setR_text(String r_text) {
		this.r_text = r_text;
	}
	public String getR_replyer() {
		return r_replyer;
	}
	public void setR_replyer(String r_replyer) {
		this.r_replyer = r_replyer;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public Timestamp getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Timestamp r_regdate) {
		this.r_regdate = r_regdate;
	}
	public Timestamp getR_update_date() {
		return r_update_date;
	}
	public void setR_update_date(Timestamp r_update_date) {
		this.r_update_date = r_update_date;
	}
	@Override
	public String toString() {
		return "GReplyVo [r_no=" + r_no + ", g_no=" + g_no + ", r_text=" + r_text + ", r_replyer=" + r_replyer
				+ ", user_code=" + user_code + ", r_regdate=" + r_regdate + ", r_update_date=" + r_update_date + "]";
	}
	
	
}
