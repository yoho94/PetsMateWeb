package com.petsmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.petsmate.dao.DriverDAO;
import com.petsmate.dto.DriverVO;

@Service
public class DriverServiceImpl implements DriverService {

	@Inject
	private DriverDAO dao;
	
	@Override
	public List<DriverVO> selectDriver() throws Exception {
		return dao.selectDriver();
	}
}
