package com.petsmate.service;

import java.util.List;

import javax.inject.Inject;

import com.petsmate.dto.ChatVO;
import org.springframework.stereotype.Service;

import com.petsmate.dao.ChatDAO;
import java.util.List;
@Service
public class ChatServiceImpl implements ChatService {
	
	@Inject
	private ChatDAO dao;
	

	// 삭제
	@Override
	public void delete(int CHATID) throws Exception {
	
	}

	


	// 목록
	public List<ChatVO> list() throws Exception {
		return null;
		
	}




	@Override
	public void enter(ChatVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}






}
