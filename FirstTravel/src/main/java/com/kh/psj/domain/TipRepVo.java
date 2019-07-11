package com.kh.psj.domain;

public class TipRepVo {
	int tip_rep_no;
	String tip_rep_content;
	String tip_rep_regdate;
	int tip_rep_writer_code;
	String tip_rep_writer_id;
	int tip_no;
	public int getTip_rep_no() {
		return tip_rep_no;
	}
	public void setTip_rep_no(int tip_rep_no) {
		this.tip_rep_no = tip_rep_no;
	}
	public String getTip_rep_content() {
		return tip_rep_content;
	}
	public void setTip_rep_content(String tip_rep_content) {
		this.tip_rep_content = tip_rep_content;
	}
	public String getTip_rep_regdate() {
		return tip_rep_regdate;
	}
	public void setTip_rep_regdate(String tip_rep_regdate) {
		this.tip_rep_regdate = tip_rep_regdate;
	}
	public int getTip_rep_writer_code() {
		return tip_rep_writer_code;
	}
	public void setTip_rep_writer_code(int tip_rep_writer_code) {
		this.tip_rep_writer_code = tip_rep_writer_code;
	}
	public String getTip_rep_writer_id() {
		return tip_rep_writer_id;
	}
	public void setTip_rep_writer_id(String tip_rep_writer_id) {
		this.tip_rep_writer_id = tip_rep_writer_id;
	}
	public int getTip_no() {
		return tip_no;
	}
	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}
	public TipRepVo(int tip_rep_no, String tip_rep_content, String tip_rep_regdate, int tip_rep_writer_code,
			String tip_rep_writer_id, int tip_no) {
		super();
		this.tip_rep_no = tip_rep_no;
		this.tip_rep_content = tip_rep_content;
		this.tip_rep_regdate = tip_rep_regdate;
		this.tip_rep_writer_code = tip_rep_writer_code;
		this.tip_rep_writer_id = tip_rep_writer_id;
		this.tip_no = tip_no;
	}
	public TipRepVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TipRepVo [tip_rep_no=" + tip_rep_no + ", tip_rep_content=" + tip_rep_content + ", tip_rep_regdate="
				+ tip_rep_regdate + ", tip_rep_writer_code=" + tip_rep_writer_code + ", tip_rep_writer_id="
				+ tip_rep_writer_id + ", tip_no=" + tip_no + "]";
	}
	
	
	

}
