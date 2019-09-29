package com.petsmate.dao;

import java.util.List;

import com.petsmate.dto.GuestVO;
import com.petsmate.dto.IotVO;

public interface IotDAO {
	public List<IotVO> select(GuestVO vo) throws Exception;
}
