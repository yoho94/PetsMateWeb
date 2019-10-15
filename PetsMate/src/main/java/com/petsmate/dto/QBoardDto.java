package com.petsmate.dto;

import java.util.Date;

public class QBoardDto {
	int qboard_seq;
	int qboard_re_ref;
	int qboard_re_lev;
	int qboard_re_seq;
	String qboard_writer;
	String qboard_subject;
	String qboard_content;
	int qboard_hits;
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
	public int getQBoard_re_ref() {
		return qboard_re_ref;
	}

	public void setQBoard_re_ref(int qboard_re_ref) {
		this.qboard_re_ref = qboard_re_ref;
	}

	public int getQBoard_re_lev() {
		return qboard_re_lev;
	}

	public void setQBoard_re_lev(int qboard_re_lev) {
		this.qboard_re_lev = qboard_re_lev;
	}

	public int getQBoard_re_seq() {
		return qboard_re_seq;
	}

	public void setQBoard_re_seq(int qboard_re_seq) {
		this.qboard_re_seq = qboard_re_seq;
	}

	public String getQBoard_writer() {
		return qboard_writer;
	}

	public void setQBoard_writer(String qboard_writer) {
		this.qboard_writer = qboard_writer;
	}

	public String getQBoard_subject() {
		return qboard_subject;
	}

	public void setQBoard_subject(String qboard_subject) {
		this.qboard_subject = qboard_subject;
	}

	public String getQBoard_content() {
		return qboard_content;
	}

	public void setQBoard_content(String qboard_content) {
		this.qboard_content = qboard_content;
	}

	public int getQBoard_hits() {
		return qboard_hits;
	}

	public void setQBoard_hits(int qboard_hits) {
		this.qboard_hits = qboard_hits;
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
