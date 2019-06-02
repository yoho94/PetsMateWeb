package com.petsmate.service;

import com.petsmate.dto.GuestVO;

import java.util.List;

public interface GuestService {
	public List<GuestVO> selectGuest() throws Exception;
	public GuestVO login(GuestVO vo) throws Exception;
	public void signup(GuestVO vo) throws Exception;
	public boolean findId(GuestVO vo) throws Exception;
}
