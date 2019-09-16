package com.petsmate.dao;

import java.util.List;

import com.petsmate.domain.BoardVO;
import com.petsmate.dto.ChatRoomVO;
import com.petsmate.dto.ChatVO;
import com.petsmate.dto.MessageVO;

public interface ChatDAO {
	/*
	public List<ChatVO> list() throws Exception;

	public ChatVO selectOne(ChatVO vo) throws Exception;

	// 작성
	public void enter(ChatVO vo) throws Exception;

	public List<ChatVO> getChatListByID(ChatVO vo) throws Exception;

	// 삭제
	public void delete(int CHATID) throws Exception;
*/
	public void createRoom(ChatRoomVO vo)throws Exception;
	public ChatRoomVO isRoom(ChatRoomVO vo)throws Exception;
	public void insertMessage(MessageVO vo)throws Exception;
	public String getPartner(ChatRoomVO vo)throws Exception;
	public String getProfile(String str)throws Exception;
	public String getName(String str)throws Exception;
	public List<MessageVO> getMessageList(String str)throws Exception;
	public List<ChatRoomVO> getRoomList(String str)throws Exception;
	public List<ChatRoomVO> getRoomList2(String str)throws Exception;
	public MessageVO getRecentMessage(String str)throws Exception;
	//public String isGetMessageList(String str)throws Exception;
	
	public String getTutorId(String str)throws Exception;
	public List<ChatRoomVO> getRoomListDriver(String str)throws Exception;
	public void updateReadTime(int class_id , String user_id , String DRIVER_USER_user_id)throws Exception;
	public void updateReadTimeDriver(int class_id , String user_id , String DRIVER_USER_user_id)throws Exception;
	
	public int getUnReadCount(String DRIVER_USER_user_id, int class_id, String user_id)throws Exception;
	public int getUnReadCountDriver(String DRIVER_USER_user_id, int class_id, String user_id)throws Exception;
	
	public int getAllCount(String str);
}
