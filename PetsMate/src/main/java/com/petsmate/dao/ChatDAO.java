package com.petsmate.dao;

import java.util.List;

import com.petsmate.domain.BoardVO;
import com.petsmate.dto.ChatVO;

public interface ChatDAO {
	public List<ChatVO> list() throws Exception;
	public ChatVO selectOne(ChatVO vo) throws Exception;
	// 작성
		public void enter(ChatVO vo) throws Exception;

	


		// 삭제
		public void delete(int CHATID) throws Exception;
}
