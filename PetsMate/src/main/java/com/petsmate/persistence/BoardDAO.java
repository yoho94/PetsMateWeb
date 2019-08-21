package com.petsmate.persistence;

import com.petsmate.domain.BoardVO;
import java.util.List;

public interface BoardDAO {

	// 작성
	public void write(BoardVO vo) throws Exception;

	// 조회
	public BoardVO read(int bno) throws Exception;

	// 수정
	public void update(BoardVO vo) throws Exception;

	// 삭제
	public void delete(int bno) throws Exception;
	
	 // 목록
	 public List<BoardVO> list() throws Exception;

}