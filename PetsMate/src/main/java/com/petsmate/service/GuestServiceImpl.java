package com.petsmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.petsmate.dao.GuestDAO;
import com.petsmate.dto.GuestVO;

@Service
public class GuestServiceImpl implements GuestService {
	@Inject
	private GuestDAO dao;
	
	@Override
	public List<GuestVO> selectGuest() throws Exception {
		return dao.selectGuest();
	}
	
	@Override
	public GuestVO login(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	
	@Override
	public void signup(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub		
		dao.signup(vo);
	}
	
	@Override
	public boolean findId(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		GuestVO findVO = dao.findId(vo);
		
		if(findVO != null)
			return true;
		else
			return false;
	}
}
