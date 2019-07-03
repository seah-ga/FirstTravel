package com.kh.psj.domain;

public class AirVo {
	private String depAirportId;
	private String arrAirportId;
	private String depPlandTime;
	public AirVo(String depAirportId, String arrAirportId, String depPlandTime) {
		super();
		this.depAirportId = depAirportId;
		this.arrAirportId = arrAirportId;
		this.depPlandTime = depPlandTime;
	}
	@Override
	public String toString() {
		return "AirVo [depAirportId=" + depAirportId + ", arrAirportId=" + arrAirportId + ", depPlandTime="
				+ depPlandTime + "]";
	}
	public String getDepAirportId() {
		return depAirportId;
	}
	public void setDepAirportId(String depAirportId) {
		this.depAirportId = depAirportId;
	}
	public String getArrAirportId() {
		return arrAirportId;
	}
	public void setArrAirportId(String arrAirportId) {
		this.arrAirportId = arrAirportId;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public AirVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
