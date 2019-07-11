package com.kh.ljh.domain;

import java.sql.Timestamp;

public class CompanionReplyVo {
	private int reply_numbercode;
	private int companion_numbercode;
	private String reply_writer;
	private String reply_content;
	private Timestamp reply_date;
	private Timestamp reply_update;
	
	public int getReply_numbercode() {
		return reply_numbercode;
	}
	public void setReply_numbercode(int reply_numbercode) {
		this.reply_numbercode = reply_numbercode;
	}
	public int getCompanion_numbercode() {
		return companion_numbercode;
	}
	public void setCompanion_numbercode(int companion_numbercode) {
		this.companion_numbercode = companion_numbercode;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Timestamp getReply_date() {
		return reply_date;
	}
	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}
	public Timestamp getReply_update() {
		return reply_update;
	}
	public void setReply_update(Timestamp reply_update) {
		this.reply_update = reply_update;
	}
	@Override
	public String toString() {
		return "CompanionReplyVo [reply_numbercode=" + reply_numbercode + ", companion_numbercode="
				+ companion_numbercode + ", reply_writer=" + reply_writer + ", reply_content=" + reply_content
				+ ", reply_date=" + reply_date + ", reply_update=" + reply_update + "]";
	}
	
	
	

	
}
