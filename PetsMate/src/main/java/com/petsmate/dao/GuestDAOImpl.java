package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.GuestVO;

@Repository
public class GuestDAOImpl implements GuestDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.petsmate.mapper.guestMapper";
	
	@Override
	public List<GuestVO> selectGuest() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".selectGuest");
	}
	
	@Override
	public GuestVO login(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".login", vo);
	}
	
	@Override
	public void signup(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace+".signup", vo);
		
	}
	
	@Override
	public GuestVO findId(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".findId", vo);
	}
}
