package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.CallPetVO;
import com.petsmate.dto.CallVO;
import com.petsmate.dto.PetVO;

@Repository
public class CallPetDAOImpl implements CallPetDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.petsmate.mapper.callPetMapper";
	
	@Override
	public List<CallPetVO> select(CallVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".select", vo);
	}
	@Override
	public int delete(CallVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace+".delete", vo);
	}
	@Override
	public List<CallPetVO> selectPet(PetVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".selectPet", vo);
	}
	@Override
	public int deletePet(PetVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace+".deletePet", vo);
	}
	@Override
	public int insert(CallPetVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".insert", vo);
	}
	


}
