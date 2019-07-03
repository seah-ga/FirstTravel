package com.kh.kdw.domain;

public class GFilePathVo {
	private String g_file_path;
	private int g_no;
	public String getG_file_path() {
		return g_file_path;
	}
	public void setG_file_path(String g_file_path) {
		this.g_file_path = g_file_path;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	@Override
	public String toString() {
		return "GFilePathVo [g_file_path=" + g_file_path + ", g_no=" + g_no + "]";
	}
	
	
}
