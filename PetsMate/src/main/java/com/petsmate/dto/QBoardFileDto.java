package com.petsmate.dto;

import java.util.Date;

public class QBoardFileDto extends CommonDto{
	int qboard_seq;
	int qfile_no;
	String qfile_name_key;
	String qfile_name;
	String qfile_path;
	String qfile_size;
	String qremark;
	String qdel_yn;
	String qins_user_id;
	Date qins_date;
	String qupd_user_id;
	Date qupd_date;

	public int getQBoard_seq() {
		return qboard_seq;
	}

	public void setQBoard_seq(int qboard_seq) {
		this.qboard_seq = qboard_seq;
	}

	public int getQFile_no() {
		return qfile_no;
	}

	public void setQFile_no(int qfile_no) {
		this.qfile_no = qfile_no;
	}

	public String getQFile_name_key() {
		return qfile_name_key;
	}

	public void setQFile_name_key(String qfile_name_key) {
		this.qfile_name_key = qfile_name_key;
	}

	public String getQFile_name() {
		return qfile_name;
	}

	public void setQFile_name(String qfile_name) {
		this.qfile_name = qfile_name;
	}

	public String getQFile_path() {
		return qfile_path;
	}

	public void setQFile_path(String qfile_path) {
		this.qfile_path = qfile_path;
	}

	public String getQFile_size() {
		return qfile_size;
	}

	public void setQFile_size(String qfile_size) {
		this.qfile_size = qfile_size;
	}

	public String getQRemark() {
		return qremark;
	}

	public void setQRemark(String qremark) {
		this.qremark = qremark;
	}

	public String getQDel_yn() {
		return qdel_yn;
	}

	public void setQDel_yn(String qdel_yn) {
		this.qdel_yn = qdel_yn;
	}

	public String getQIns_user_id() {
		return qins_user_id;
	}

	public void setQIns_user_id(String qins_user_id) {
		this.qins_user_id = qins_user_id;
	}

	public Date getQIns_date() {
		return qins_date;
	}

	public void setQIns_date(Date qins_date) {
		this.qins_date = qins_date;
	}

	public String getQUpd_user_id() {
		return qupd_user_id;
	}

	public void setQUpd_user_id(String qupd_user_id) {
		this.qupd_user_id = qupd_user_id;
	}

	public Date getQUpd_date() {
		return qupd_date;
	}

	public void setQUpd_date(Date qupd_date) {
		this.qupd_date = qupd_date;
	}
}
