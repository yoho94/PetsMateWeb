package com.petsmate.service;

import com.petsmate.dto.GuestVO;

import java.util.List;

public interface GuestService {
	public List<GuestVO> selectMember() throws Exception;
	public GuestVO login(GuestVO vo) throws Exception;
}
