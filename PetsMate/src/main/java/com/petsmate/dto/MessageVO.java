package com.petsmate.dto;

import java.util.Date;

import com.google.gson.Gson;



public class MessageVO {
	
	private String message_id;
	private String message_sender;
	private String message_receiver;
	private String message_content;
	private Date message_sendTime;
	private Date message_readTime;
	private String CHATROOM_chatroom_id;
	private String USER_user_id;
	private String DRIVER_USER_user_id;
	private int CLASS_class_id;
	private String user_profileImagePath;
	private String receiver_user_profileImagePath;
	private String user_name;
	private String receiver_user_name;
	private String class_name;
	private int class_id;
	private String DRIVER_driver_id;
	private String DRIVER_name;
	private String user_id;
	private int unReadCount;
	
	
	
	
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_receiver() {
		return message_receiver;
	}
	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_sendTime() {
		return message_sendTime;
	}
	public void setMessage_sendTime(Date message_sendTime) {
		this.message_sendTime = message_sendTime;
	}
	public Date getMessage_readTime() {
		return message_readTime;
	}
	public void setMessage_readTime(Date message_readTime) {
		this.message_readTime = message_readTime;
	}
	public String getCHATROOM_chatroom_id() {
		return CHATROOM_chatroom_id;
	}
	public void setCHATROOM_chatroom_id(String cHATROOM_chatroom_id) {
		CHATROOM_chatroom_id = cHATROOM_chatroom_id;
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
	public String getUser_profileImagePath() {
		return user_profileImagePath;
	}
	public void setUser_profileImagePath(String user_profileImagePath) {
		this.user_profileImagePath = user_profileImagePath;
	}
	public String getReceiver_user_profileImagePath() {
		return receiver_user_profileImagePath;
	}
	public void setReceiver_user_profileImagePath(String receiver_user_profileImagePath) {
		this.receiver_user_profileImagePath = receiver_user_profileImagePath;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReceiver_user_name() {
		return receiver_user_name;
	}
	public void setReceiver_user_name(String receiver_user_name) {
		this.receiver_user_name = receiver_user_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getDRIVER_driver_id() {
		return DRIVER_driver_id;
	}
	public void setDRIVER_driver_id(String dRIVER_driver_id) {
		DRIVER_driver_id = dRIVER_driver_id;
	}
	public String getDRIVER_name() {
		return DRIVER_name;
	}
	public void setDRIVER_name(String dRIVER_name) {
		DRIVER_name = dRIVER_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	public static MessageVO convertMessage(String source) {
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MessageVO.class);
		return message;
	}
	@Override
	public String toString() {
		return "MessageVO [message_id=" + message_id + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_content=" + message_content + ", message_sendTime=" + message_sendTime
				+ ", message_readTime=" + message_readTime + ", CHATROOM_chatroom_id=" + CHATROOM_chatroom_id
				+ ", USER_user_id=" + USER_user_id + ", DRIVER_USER_user_id=" + DRIVER_USER_user_id + ", CLASS_class_id="
				+ CLASS_class_id + ", user_profileImagePath=" + user_profileImagePath
				+ ", receiver_user_profileImagePath=" + receiver_user_profileImagePath + ", user_name=" + user_name
				+ ", receiver_user_name=" + receiver_user_name + ", class_name=" + class_name + ", class_id=" + class_id
				+ ", TUTOR_tutor_id=" + DRIVER_driver_id + ", driver_name=" + DRIVER_name + ", user_id=" + user_id
				+ ", unReadCount=" + unReadCount + "]";
	}

	
}