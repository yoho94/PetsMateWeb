package com.petsmate.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petsmate.dto.QBoardDto;
import com.petsmate.domain.QBoardForm;


@Repository
public class QBoardDao {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.petsmate.mapper.qboardMapper";

	public List<QBoardDto> getQBoardList(QBoardForm qboardForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getQBoardList");
	}

}
