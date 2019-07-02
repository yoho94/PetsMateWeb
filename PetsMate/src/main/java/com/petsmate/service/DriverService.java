package com.petsmate.service;

import java.util.List;

import com.petsmate.dto.DriverVO;

public interface DriverService {
	public List<DriverVO> selectDriver() throws Exception;
}
