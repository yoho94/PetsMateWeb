package com.petsmate.dto;

import java.sql.Timestamp;

public class CallVO {
	private Integer serial_number, code, guest_count, shuttle_code;
	private String guest_id, driver_id, start_latitude, start_longitude, destination_latitude, destination_longitude, place_name, place_addr, place_name_start, place_addr_start, ps;
	private Timestamp start_time, destination_time, generate_time;
	private boolean is_call, is_shuttle;
	
	public Integer getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(Integer serial_number) {
		this.serial_number = serial_number;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Integer getGuest_count() {
		return guest_count;
	}
	public void setGuest_count(Integer guest_count) {
		this.guest_count = guest_count;
	}
	public Integer getShuttle_code() {
		return shuttle_code;
	}
	public void setShuttle_code(Integer shuttle_code) {
		this.shuttle_code = shuttle_code;
	}
	public String getGuest_id() {
		return guest_id;
	}
	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getStart_latitude() {
		return start_latitude;
	}
	public void setStart_latitude(String start_latitude) {
		this.start_latitude = start_latitude;
	}
	public String getStart_longitude() {
		return start_longitude;
	}
	public void setStart_longitude(String start_longitude) {
		this.start_longitude = start_longitude;
	}
	public String getDestination_latitude() {
		return destination_latitude;
	}
	public void setDestination_latitude(String destination_latitude) {
		this.destination_latitude = destination_latitude;
	}
	public String getDestination_longitude() {
		return destination_longitude;
	}
	public void setDestination_longitude(String destination_longitude) {
		this.destination_longitude = destination_longitude;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_addr() {
		return place_addr;
	}
	public void setPlace_addr(String place_addr) {
		this.place_addr = place_addr;
	}
	public String getPlace_name_start() {
		return place_name_start;
	}
	public void setPlace_name_start(String place_name_start) {
		this.place_name_start = place_name_start;
	}
	public String getPlace_addr_start() {
		return place_addr_start;
	}
	public void setPlace_addr_start(String place_addr_start) {
		this.place_addr_start = place_addr_start;
	}
	public String getPs() {
		return ps;
	}
	public void setPs(String ps) {
		this.ps = ps;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public Timestamp getDestination_time() {
		return destination_time;
	}
	public void setDestination_time(Timestamp destination_time) {
		this.destination_time = destination_time;
	}
	public Timestamp getGenerate_time() {
		return generate_time;
	}
	public void setGenerate_time(Timestamp generate_time) {
		this.generate_time = generate_time;
	}
	public boolean isIs_call() {
		return is_call;
	}
	public void setIs_call(boolean is_call) {
		this.is_call = is_call;
	}
	public boolean isIs_shuttle() {
		return is_shuttle;
	}
	public void setIs_shuttle(boolean is_shuttle) {
		this.is_shuttle = is_shuttle;
	}
	
	

}
