package com.petsmate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petsmate.domain.QBoardForm;
import com.petsmate.dao.QBoardDao;
import com.petsmate.dto.QBoardDto;

public class QBoardService {
	@Autowired
	private QBoardDao qboardDao;

	public List<QBoardDto> getQBoardList(QBoardForm qboardForm) throws Exception {

		return qboardDao.getQBoardList(qboardForm);
	}
}
