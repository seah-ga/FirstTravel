package com.kh.kdw.domain;

import java.sql.Timestamp;

public class MemberVo {
	private int user_code;			// 유저 코드
	private String user_id;			// 회원 아이디
	private String user_name;		// 이름
	private String user_pw;			// 비밀번호
	private int address_num;		// 우편번호
	private String user_address;	// 주소
	private String search_address;	// 검색 주소
	private String detail_address;	// 상세주소
	private String user_phone;		// 전화번호
	private String user_email;		//이메일
	private String chk_ad = "N";	// 광고 수신 여부
	private int user_point;			//포인트
	private Timestamp joindate;		// 가입일
	
	
	public int getUser_code() {
		return user_code;
	}


	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public int getAddress_num() {
		return address_num;
	}


	public void setAddress_num(int address_num) {
		this.address_num = address_num;
	}


	public String getUser_address() {
		return user_address;
	}


	public void setUser_address(String search_address, String detail_address) {
		this.user_address = search_address + " " + detail_address;
	}


	public String getSearch_address() {
		return search_address;
	}


	public void setSearch_address(String search_address) {
		this.search_address = search_address;
	}


	public String getDetail_address() {
		return detail_address;
	}


	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getChk_ad() {
		return chk_ad;
	}


	public void setChk_ad(String chk_ad) {
		this.chk_ad = chk_ad;
	}


	public int getUser_point() {
		return user_point;
	}


	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}


	public Timestamp getJoindate() {
		return joindate;
	}


	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}


	@Override
	public String toString() {
		return "MemberVo [user_code=" + user_code + ", user_id=" + user_id + ", user_name=" + user_name + ", user_pw="
				+ user_pw + ", address_num=" + address_num + ", user_address=" + user_address + ", search_address="
				+ search_address + ", detail_address=" + detail_address + ", user_phone=" + user_phone + ", user_email="
				+ user_email + ", chk_ad=" + chk_ad + ", user_point=" + user_point + ", joindate=" + joindate + "]";
	}

	
	

}
