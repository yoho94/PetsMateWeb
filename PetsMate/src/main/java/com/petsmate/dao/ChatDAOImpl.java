package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.ChatVO;

@Repository
public class ChatDAOImpl  implements ChatDAO{
	
	@Inject
	private SqlSession sql;
	
	private static final String Namespace = "com.petsmate.mapper.chatMapper";
	//목록
	@Override
	public List<ChatVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(Namespace+".selectChat");
	}
	
	@Override
	public ChatVO selectOne(ChatVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(Namespace+".selectOne", vo);
	}
	// 삭제
		@Override
	public void delete(int CHATID) throws Exception {
			sql.delete(Namespace + ".delete", CHATID);
		}
		// 작성
		@Override
		public void enter(ChatVO vo) throws Exception {
			sql.insert(Namespace + ".write", vo);
		}

}
