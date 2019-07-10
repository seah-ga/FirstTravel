package com.kh.kdw.domain;

import java.sql.Timestamp;

public class MemberBoardVo {
	private int writeCount;
	private String boardName;
	private String title;
	private Timestamp regdate;
	public int getWriteCount() {
		return writeCount;
	}
	public void setWriteCount(int writeCount) {
		this.writeCount = writeCount;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberBoardVo [writeCount=" + writeCount + ", boardName=" + boardName + ", title=" + title
				+ ", regdate=" + regdate + "]";
	}
	
	
}
