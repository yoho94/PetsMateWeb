package com.petsmate.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.petsmate.domain.BoardVO;
import com.petsmate.persistence.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	 //작성
	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}

	 //조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	 //수정
	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	 //삭제
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}
}