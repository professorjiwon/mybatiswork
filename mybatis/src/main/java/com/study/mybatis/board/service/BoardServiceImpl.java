package com.study.mybatis.board.service;

import org.apache.ibatis.session.SqlSession;

import com.study.mybatis.board.dao.BoardDao;
import com.study.mybatis.common.template.Template;

public class BoardServiceImpl implements BoardService {
	private BoardDao bDao = new BoardDao();
	
	@Override
	public int selectTotalRecord() {
		SqlSession sqlSession = Template.getSqlSession();
		int totalRecord = bDao.selectTotalRecord(sqlSession);
		sqlSession.close();
		return totalRecord;
	}

}





