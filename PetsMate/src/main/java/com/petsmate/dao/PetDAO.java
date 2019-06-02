package com.petsmate.dao;

import java.util.List;

import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetVO;

public interface PetDAO {
	public List<PetVO> login(GuestVO vo) throws Exception;
	public void signup(PetVO vo) throws Exception;
}
