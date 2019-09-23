package com.petsmate.persistence;

import java.util.List;

import com.petsmate.domain.BoardVO;
import com.petsmate.domain.ReplyVO;

public interface ReplyDAO {

	// 댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	// 댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;

	// 댓글 수정
	public void replyUpdate(ReplyVO vo) throws Exception;

	// 댓글 삭제
	public void replyDelete(ReplyVO vo) throws Exception;

}