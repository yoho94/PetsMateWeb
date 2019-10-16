package com.petsmate.domain;


public class CommonForm {
	
	String qfunction_name;
	int qcurrent_page_no;
	int qcount_per_page;
	int qcount_per_list;
	int qtatal_page_count;
	int qtatal_list_count;
	int qlimit;
	int qoffset;

	public String getQFunction_name() {
		return qfunction_name;
	}

	public void setQFunction_name(String qfunction_name) {
		this.qfunction_name = qfunction_name;
	}

	public int getQCurrent_page_no() {
		return qcurrent_page_no;
	}

	public void setQCurrent_page_no(int qcurrent_page_no) {
		this.qcurrent_page_no = qcurrent_page_no;
	}

	public int getQCount_per_page() {
		return qcount_per_page;
	}

	public void setQCount_per_page(int qcount_per_page) {
		this.qcount_per_page = qcount_per_page;
	}

	public int getQCount_per_list() {
		return qcount_per_list;
	}

	public void setQCount_per_list(int qcount_per_list) {
		this.qcount_per_list = qcount_per_list;
	}

	public int getQTatal_page_count() {
		return qtatal_page_count;
	}

	public void setQTatal_page_count(int qtatal_page_count) {
		this.qtatal_page_count = qtatal_page_count;
	}

	public int getQTatal_list_count() {
		return qtatal_list_count;
	}

	public void setQTatal_list_count(int qtatal_list_count) {
		this.qtatal_list_count = qtatal_list_count;
	}

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

}
