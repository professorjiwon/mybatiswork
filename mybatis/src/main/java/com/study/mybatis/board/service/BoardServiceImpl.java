package com.study.mybatis.board.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.study.mybatis.board.dao.BoardDao;
import com.study.mybatis.board.vo.Board;
import com.study.mybatis.common.template.Template;
import com.study.mybatis.common.vo.PageInfo;

public class BoardServiceImpl implements BoardService {
	private BoardDao bDao = new BoardDao();
	
	@Override
	public int selectTotalRecord() {
		SqlSession sqlSession = Template.getSqlSession();
		int totalRecord = bDao.selectTotalRecord(sqlSession);
		sqlSession.close();
		return totalRecord;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Board> list = bDao.selectList(sqlSession, pi);
		sqlSession.close();
		return list;
	}

}





