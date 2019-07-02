package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetVO;

@Repository
public class PetDAOImpl implements PetDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.petsmate.mapper.petMapper";
	
	@Override
	public List<PetVO> login(GuestVO vo) throws Exception {
		return sqlSession.selectList(Namespace+".login", vo);
	}
	@Override
	public void signup(PetVO vo) throws Exception {
		sqlSession.insert(Namespace+".signup", vo);
	}
	
	@Override
	public void update(PetVO vo) throws Exception {
		sqlSession.update(Namespace+".update", vo);		
	}
	
	@Override
	public void delete(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(Namespace+".delete", vo);
	}

}
