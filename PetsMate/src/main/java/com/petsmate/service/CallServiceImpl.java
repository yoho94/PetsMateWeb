package com.petsmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.petsmate.dao.CallDAO;
import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;

@Service
public class CallServiceImpl implements CallService{
	
	@Inject
	private CallDAO dao;
	
	@Override
	public List<CallVO> login(GuestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	
	@Override
	public int insert(CallVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insert(vo);
	}

}
