package com.petsmate.dao;

import java.util.List;

import com.petsmate.dto.GuestVO;

public interface GuestDAO {
	public List<GuestVO> selectGuest() throws Exception;
	public GuestVO login(GuestVO vo) throws Exception;
	public void signup(GuestVO vo) throws Exception;
	public GuestVO findId(GuestVO vo) throws Exception;
}
