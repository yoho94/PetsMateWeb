package com.petsmate.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class IotVO {
	private String ID;
	private Integer PET_CODE;
	private Timestamp GENERATE_TIME;
	private String LATITUDE;
	private String LONGITUDE;
	private Integer HEART_RATE;
	private String date, time;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public Integer getPET_CODE() {
		return PET_CODE;
	}
	public void setPET_CODE(Integer pET_CODE) {
		PET_CODE = pET_CODE;
	}
	public Timestamp getGENERATE_TIME() {
		return GENERATE_TIME;
	}
	
	public String getDate() {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String date = sdf.format(GENERATE_TIME);
		return date;
	}
	
	public String getTime() {
		String pattern = "a hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String date = sdf.format(GENERATE_TIME);
		return date;
	}
	
	public void setGENERATE_TIME(Timestamp gENERATE_TIME) {
		GENERATE_TIME = gENERATE_TIME;
	}
	public String getLATITUDE() {
		return LATITUDE;
	}
	public void setLATITUDE(String lATITUDE) {
		LATITUDE = lATITUDE;
	}
	public String getLONGITUDE() {
		return LONGITUDE;
	}
	public void setLONGITUDE(String lONGITUDE) {
		LONGITUDE = lONGITUDE;
	}
	public Integer getHEART_RATE() {
		return HEART_RATE;
	}
	public void setHEART_RATE(Integer hEART_RATE) {
		HEART_RATE = hEART_RATE;
	}
	@Override
	public String toString() {
		return "IotVO [ID=" + ID + ", PET_CODE=" + PET_CODE + ", GENERATE_TIME=" + GENERATE_TIME + ", LATITUDE="
				+ LATITUDE + ", LONGITUDE=" + LONGITUDE + ", HEART_RATE=" + HEART_RATE + "]";
	}
	
	
}
