package com.petsmate.dto;

public class CommonDto {
	
	int qlimit;
	int qoffset;
	String qpagination;

	public int getQLimit() {
		return qlimit;
	}

	public void setQLimit(int qlimit) {
		this.qlimit = qlimit;
	}

	public int getQOffset() {
		return qoffset;
	}

	public void setQOffset(int qoffset) {
		this.qoffset = qoffset;
	}

	public String getQPagination() {
		return qpagination;
	}

	public void setQPagination(String qpagination) {
		this.qpagination = qpagination;
	}
	

}
