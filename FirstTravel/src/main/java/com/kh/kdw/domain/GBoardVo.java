package com.kh.kdw.domain;

import java.sql.Timestamp;
import java.util.Arrays;

public class GBoardVo {
	private int g_no;				// 겔러리 글번호
	private String g_title;			// 겔러리 글제목
	private String g_location;		// 여행 지역
	private String g_content;		// 글내용
	private String g_writer;		// 작성자
	private int g_viewcnt;			// 조회수
	private int g_replycnt;			// 리플수
	private Timestamp g_regdate;	// 작성일
	private String fileone;
	private String[] files;			// 파일 담을 배열
	
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	
	public String getG_title() {
		return g_title;
	}
	public void setG_title(String g_title) {
		this.g_title = g_title;
	}
	public String getG_location() {
		return g_location;
	}
	public void setG_location(String g_location) {
		this.g_location = g_location;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public String getG_writer() {
		return g_writer;
	}
	public void setG_writer(String g_writer) {
		this.g_writer = g_writer;
	}
	public int getG_viewcnt() {
		return g_viewcnt;
	}
	public void setG_viewcnt(int g_viewcnt) {
		this.g_viewcnt = g_viewcnt;
	}
	public int getG_replycnt() {
		return g_replycnt;
	}
	public void setG_replycnt(int g_replycnt) {
		this.g_replycnt = g_replycnt;
	}
	public Timestamp getG_regdate() {
		return g_regdate;
	}
	public void setG_regdate(Timestamp g_regdate) {
		this.g_regdate = g_regdate;
	}
	

	public String getFileone() {
		return fileone;
	}
	public void setFileone(String fileone) {
		this.fileone = fileone;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "GBoardVo [g_no=" + g_no + ", g_title=" + g_title + ", g_location=" + g_location + ", g_content="
				+ g_content + ", g_writer=" + g_writer + ", g_viewcnt=" + g_viewcnt + ", g_replycnt=" + g_replycnt
				+ ", g_regdate=" + g_regdate + ", fileone=" + fileone + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
