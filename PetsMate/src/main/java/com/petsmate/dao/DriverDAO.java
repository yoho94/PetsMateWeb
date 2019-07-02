package com.petsmate.dao;

import java.util.List;

import com.petsmate.dto.DriverVO;

public interface DriverDAO {
	public List<DriverVO> selectDriver() throws Exception;
	public DriverVO login(DriverVO vo) throws Exception;
	public void signup(DriverVO vo) throws Exception;
	public DriverVO findId(DriverVO vo) throws Exception;
}
