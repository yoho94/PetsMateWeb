package com.petsmate.dto;

public class ChatVO {
	int CHATID;
	String FROMID;
	String TOID;
	String CHATCONTENT;
	String CHATTIME;
	String TOKEN;
	public int getCHATID() {
		return CHATID;
	}
	public void setCHATID(int cHATID) {
		CHATID = cHATID;
	}
	public String getFROMID() {
		return FROMID;
	}
	public void setFROMID(String fROMID) {
		FROMID = fROMID;
	}
	public String getTOID() {
		return TOID;
	}
	public void setTOID(String tOID) {
		TOID = tOID;
	}
	public String getCHATCONTENT() {
		return CHATCONTENT;
	}
	public void setCHATCONTENT(String cHATCONTENT) {
		CHATCONTENT = cHATCONTENT;
	}
	public String getCHATTIME() {
		return CHATTIME;
	}
	public void setCHATTIME(String cHATTIME) {
		CHATTIME = cHATTIME;
	}
	public String getTOKEN() {
		return TOKEN;
	}
	public void setTOKEN(String tOKEN) {
		TOKEN = tOKEN;
	}
	@Override
	public String toString() {
		return "ChatVO [CHATID=" + CHATID + ", FROMID=" + FROMID + ", TOID=" + TOID + ", CHATCONTENT=" + CHATCONTENT
				+ ", CHATTIME=" + CHATTIME + ", TOKEN=" + TOKEN + "]";
	}
	
	
}
