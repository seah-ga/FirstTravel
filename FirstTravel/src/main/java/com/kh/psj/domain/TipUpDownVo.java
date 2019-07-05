package com.kh.psj.domain;

public class TipUpDownVo {
	int user_code;
	int tip_no;
	String tip_sort;
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public int getTip_no() {
		return tip_no;
	}
	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}
	public String getTip_sort() {
		return tip_sort;
	}
	public void setTip_sort(String tip_sort) {
		this.tip_sort = tip_sort;
	}
	@Override
	public String toString() {
		return "TipUpDownVo [user_code=" + user_code + ", tip_no=" + tip_no + ", tip_sort=" + tip_sort + "]";
	}
	public TipUpDownVo(int user_code, int tip_no, String tip_sort) {
		super();
		this.user_code = user_code;
		this.tip_no = tip_no;
		this.tip_sort = tip_sort;
	}
	public TipUpDownVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}