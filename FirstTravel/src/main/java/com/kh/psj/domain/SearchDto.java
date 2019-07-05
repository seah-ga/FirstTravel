package com.kh.psj.domain;

public class SearchDto {
	String search_type;
	String search_val;
	String tip_country;
	
	public String getTip_country() {
		return tip_country;
	}
	public void setTip_country(String tip_country) {
		this.tip_country = tip_country;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getSearch_val() {
		return search_val;
	}
	public void setSearch_val(String search_val) {
		this.search_val = search_val;
	}
	public SearchDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchDto(String search_type, String search_val, String tip_country) {
		super();
		this.search_type = search_type;
		this.search_val = search_val;
		this.tip_country = tip_country;
	}
	@Override
	public String toString() {
		return "SearchDto [search_type=" + search_type + ", search_val=" + search_val + ", tip_country=" + tip_country
				+ "]";
	}

	

}
