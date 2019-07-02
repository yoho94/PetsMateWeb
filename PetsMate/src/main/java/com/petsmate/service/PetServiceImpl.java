package com.petsmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.petsmate.dao.PetDAO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetVO;

@Service
public class PetServiceImpl implements PetService{
	
	@Inject
	private PetDAO dao;
	
	@Override
	public List<PetVO> login(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	@Override
	public void signup(PetVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.signup(vo);
	}
	
	@Override
	public void update(PetVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	
	@Override
	public void delete(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}
}
