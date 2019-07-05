package com.kh.psj.domain;

import java.security.Timestamp;
import java.util.List;

public class TipVo {
	int tip_no;
	String tip_content;
	String tip_regdate;
	int tip_writer_code;
	int tip_up;
	int tip_down;
	String tip_country;
	PsjPagingDto psjPagingDto;
	String tip_writer_id;
	TipUpDownVo updownVo;
	List<TipUpDownVo> updownList;
	public int getTip_no() {
		return tip_no;
	}
	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}
	public String getTip_content() {
		return tip_content;
	}
	public void setTip_content(String tip_content) {
		this.tip_content = tip_content;
	}
	public String getTip_regdate() {
		return tip_regdate;
	}
	public void setTip_regdate(String tip_regdate) {
		this.tip_regdate = tip_regdate;
	}
	public int getTip_writer_code() {
		return tip_writer_code;
	}
	public void setTip_writer_code(int tip_writer_code) {
		this.tip_writer_code = tip_writer_code;
	}
	public int getTip_up() {
		return tip_up;
	}
	public void setTip_up(int tip_up) {
		this.tip_up = tip_up;
	}
	public int getTip_down() {
		return tip_down;
	}
	public void setTip_down(int tip_down) {
		this.tip_down = tip_down;
	}
	public String getTip_country() {
		return tip_country;
	}
	public void setTip_country(String tip_country) {
		this.tip_country = tip_country;
	}
	public PsjPagingDto getPsjPagingDto() {
		return psjPagingDto;
	}
	public void setPsjPagingDto(PsjPagingDto psjPagingDto) {
		this.psjPagingDto = psjPagingDto;
	}
	public String getTip_writer_id() {
		return tip_writer_id;
	}
	public void setTip_writer_id(String tip_writer_id) {
		this.tip_writer_id = tip_writer_id;
	}
	public TipUpDownVo getUpdownVo() {
		return updownVo;
	}
	public void setUpdownVo(TipUpDownVo updownVo) {
		this.updownVo = updownVo;
	}
	public List<TipUpDownVo> getUpdownList() {
		return updownList;
	}
	public void setUpdownList(List<TipUpDownVo> updownList) {
		this.updownList = updownList;
	}
	@Override
	public String toString() {
		return "TipVo [tip_no=" + tip_no + ", tip_content=" + tip_content + ", tip_regdate=" + tip_regdate
				+ ", tip_writer_code=" + tip_writer_code + ", tip_up=" + tip_up + ", tip_down=" + tip_down
				+ ", tip_country=" + tip_country + ", psjPagingDto=" + psjPagingDto + ", tip_writer_id=" + tip_writer_id
				+ ", updownVo=" + updownVo + ", updownList=" + updownList + "]";
	}
	public TipVo(int tip_no, String tip_content, String tip_regdate, int tip_writer_code, int tip_up, int tip_down,
			String tip_country, PsjPagingDto psjPagingDto, String tip_writer_id, TipUpDownVo updownVo,
			List<TipUpDownVo> updownList) {
		super();
		this.tip_no = tip_no;
		this.tip_content = tip_content;
		this.tip_regdate = tip_regdate;
		this.tip_writer_code = tip_writer_code;
		this.tip_up = tip_up;
		this.tip_down = tip_down;
		this.tip_country = tip_country;
		this.psjPagingDto = psjPagingDto;
		this.tip_writer_id = tip_writer_id;
		this.updownVo = updownVo;
		this.updownList = updownList;
	}
	public TipVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	
	
	


	
	
	
	
	
	
	
	
	
	
	

	
	
   
}
