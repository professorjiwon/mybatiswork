package com.study.mybatis.board.dao;

import org.apache.ibatis.session.SqlSession;

public class BoardDao {

	public int selectTotalRecord(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.selectTotalRecord");
	}

}
