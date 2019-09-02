package com.petsmate.service;

import com.petsmate.dto.ChatVO;
import java.util.List;


public interface ChatService {
	
	    // 입장
		public void enter(ChatVO vo) throws Exception;

		// 삭제
		public void delete(int CHATID) throws Exception;

	
		
	


		// 목록
		public List<ChatVO> list() throws Exception;

	}

