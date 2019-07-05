package com.kh.nds.domain;


public class ReviewReplyVo {
	private int review_reply_num;
	private int review_num;
	private int user_code;
	private String review_reply_content;
	private String review_reply_writer;
	private String review_reply_date;
	public ReviewReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReview_reply_num() {
		return review_reply_num;
	}
	public void setReview_reply_num(int review_reply_num) {
		this.review_reply_num = review_reply_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getReview_reply_content() {
		return review_reply_content;
	}
	public void setReview_reply_content(String review_reply_content) {
		this.review_reply_content = review_reply_content;
	}
	public String getReview_reply_writer() {
		return review_reply_writer;
	}
	public void setReview_reply_writer(String review_reply_writer) {
		this.review_reply_writer = review_reply_writer;
	}
	public String getReview_reply_date() {
		return review_reply_date;
	}
	public void setReview_reply_date(String review_reply_date) {
		this.review_reply_date = review_reply_date;
	}
	public ReviewReplyVo(int review_reply_num, int review_num, int user_code, String review_reply_content,
			String review_reply_writer, String review_reply_date) {
		super();
		this.review_reply_num = review_reply_num;
		this.review_num = review_num;
		this.user_code = user_code;
		this.review_reply_content = review_reply_content;
		this.review_reply_writer = review_reply_writer;
		this.review_reply_date = review_reply_date;
	}
	@Override
	public String toString() {
		return "ReviewReplyVo [review_reply_num=" + review_reply_num + ", review_num=" + review_num + ", user_code="
				+ user_code + ", review_reply_content=" + review_reply_content + ", review_reply_writer="
				+ review_reply_writer + ", review_reply_date=" + review_reply_date + "]";
	}
	
	
}
