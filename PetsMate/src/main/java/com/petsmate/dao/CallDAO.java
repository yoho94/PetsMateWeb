package com.petsmate.dao;

import java.util.List;

import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;

public interface CallDAO {
	public List<CallVO> login(GuestVO vo) throws Exception;
	public int insert(CallVO vo) throws Exception;
	public int updateShuttle(CallVO vo) throws Exception;
}
