package com.kh.psj.domain;

public class HotelVo {
	private String hotelEntId;

	public String getHotelEntId() {
		return hotelEntId;
	}

	public void setHotelEntId(String hotelEntId) {
		this.hotelEntId = hotelEntId;
	}

	@Override
	public String toString() {
		return "HotelVo [hotelEntId=" + hotelEntId + "]";
	}

	public HotelVo(String hotelEntId) {
		super();
		this.hotelEntId = hotelEntId;
	}

	public HotelVo() {
		super();
		// TODO Auto-generated constructor stub
	}

}
