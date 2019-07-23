package com.petsmate.dao;

import java.util.List;

import com.petsmate.dto.CallPetVO;
import com.petsmate.dto.CallVO;
import com.petsmate.dto.PetVO;

public interface CallPetDAO {
	public List<CallPetVO> select(CallVO vo) throws Exception;
	public int delete(CallVO vo) throws Exception;
	public List<CallPetVO> selectPet(PetVO vo) throws Exception;
	public int deletePet(PetVO vo) throws Exception;
	public int insert(CallPetVO vo) throws Exception;
}
