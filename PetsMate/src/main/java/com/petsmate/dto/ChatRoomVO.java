package com.petsmate.dto;

/*
 
 chatID varchar(20) not null
 guestID varchar(20) not null
 driverID varchar(20) not null
 classID int not null
 
 primarykey chatID
 */

public class ChatRoomVO {
	
	private String chatID;
	private String guestID;
	private String driverID;
	private int classID;
	public String getChatID() {
		return chatID;
	}
	public void setChatID(String chatID) {
		this.chatID = chatID;
	}
	public String getGuestID() {
		return guestID;
	}
	public void setGuestID(String guestID) {
		this.guestID = guestID;
	}
	public String getDriverID() {
		return driverID;
	}
	public void setDriverID(String driverID) {
		this.driverID = driverID;
	}
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [chatID=" + chatID + ", guestID=" + guestID + ", driverID=" + driverID + ", classID="
				+ classID + "]";
	}
	
	

	
}