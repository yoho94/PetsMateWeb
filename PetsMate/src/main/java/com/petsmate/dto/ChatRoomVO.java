package com.petsmate.dto;

public class ChatRoomVO {
private String chatroom_id;
private String USER_user_id;
private String DRIVER_USER_user_id;
private int CLASS_class_id;
public String getChatroom_id() {
	return chatroom_id;
}
public void setChatroom_id(String chatroom_id) {
	this.chatroom_id = chatroom_id;
}
public String getUSER_user_id() {
	return USER_user_id;
}
public void setUSER_user_id(String uSER_user_id) {
	USER_user_id = uSER_user_id;
}
public String getDRIVER_USER_user_id() {
	return DRIVER_USER_user_id;
}
public void setDRIVER_USER_user_id(String dRIVER_USER_user_id) {
	DRIVER_USER_user_id = dRIVER_USER_user_id;
}
public int getCLASS_class_id() {
	return CLASS_class_id;
}
public void setCLASS_class_id(int cLASS_class_id) {
	CLASS_class_id = cLASS_class_id;
}
@Override
public String toString() {
	return "ChatRoomVO [chatroom_id=" + chatroom_id + ", USER_user_id=" + USER_user_id + ", DRIVER_USER_user_id="
			+ DRIVER_USER_user_id + ", CLASS_class_id=" + CLASS_class_id + "]";
}





}