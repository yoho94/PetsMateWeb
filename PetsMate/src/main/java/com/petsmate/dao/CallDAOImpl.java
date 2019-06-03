package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;

@Repository
public class CallDAOImpl  implements CallDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.petsmate.mapper.callMapper";
	
	@Override
	public List<CallVO> login(GuestVO vo) throws Exception {
		return sqlSession.selectList(Namespace+".login", vo);
	}
	
	@Override
	public int insert(CallVO vo) throws Exception {		
		return sqlSession.insert(Namespace+".insert", vo);
	}

}
