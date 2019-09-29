package com.petsmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.IotVO;

@Repository
public class IotDAOImpl implements IotDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.petsmate.mapper.iotMapper";

	@Override
	public List<IotVO> select(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".select", vo);
	}

}
