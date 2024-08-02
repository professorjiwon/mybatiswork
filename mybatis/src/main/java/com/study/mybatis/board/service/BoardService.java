package com.study.mybatis.board.service;

import java.util.ArrayList;

import com.study.mybatis.board.vo.Board;
import com.study.mybatis.common.vo.PageInfo;

public interface BoardService {
	// 게시판 리스트 조회
	int selectTotalRecord();	
	ArrayList<Board> selectList(PageInfo pi);
	
	// 상세조회
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
}
