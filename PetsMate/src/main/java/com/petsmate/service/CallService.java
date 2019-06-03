package com.petsmate.service;

import java.util.List;

import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;

public interface CallService {
	public List<CallVO> login(GuestVO vo) throws Exception;
	public int insert(CallVO vo) throws Exception;
}
