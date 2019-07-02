package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.DriverVO;

@Repository
public class DriverDAOImpl implements DriverDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.petsmate.mapper.driverMapper";

	@Override
	public List<DriverVO> selectDriver() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".selectDriver");
	}

	@Override
	public DriverVO login(DriverVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signup(DriverVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DriverVO findId(DriverVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
