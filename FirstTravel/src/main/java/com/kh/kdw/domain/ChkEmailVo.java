package com.kh.kdw.domain;

public class ChkEmailVo {
	private int email_code;
	private String user_email;
	private String authkey;
	public int getEmail_code() {
		return email_code;
	}
	public void setEmail_code(int email_code) {
		this.email_code = email_code;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	@Override
	public String toString() {
		return "ChkEmailVo [email_code=" + email_code + ", user_email=" + user_email + ", authkey=" + authkey + "]";
	}
	
	
}
