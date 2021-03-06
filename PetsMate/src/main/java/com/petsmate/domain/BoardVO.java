package com.petsmate.domain;

import java.util.Date;

public class BoardVO {
	/*
	 *     bno       int,      not null, auto_increment,   
	 *     title     varchar2(30)   not null,       
	 *     content   text        not null,
	 *     writer    varchar2(30)    not null,
	 *     regDate   date          {(default getdate,)(default current_timestamp,)}
	 *     viewCnt   int           default 0,
	       primary key(bno)
           ); 
           
           alter table myBoard change bno bno int(11) not null auto_increment;
	 */
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String password;
	private Date regDate;
	private int viewCnt;
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", viewCnt=" + viewCnt + "]";
	}
	
	

}