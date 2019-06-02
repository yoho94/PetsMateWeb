package com.petsmate.service;

import java.util.List;

import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetVO;

public interface PetService {
	public List<PetVO> login(GuestVO vo) throws Exception;
	public void signup(PetVO vo) throws Exception;
}
