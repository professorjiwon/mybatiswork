package com.study.mybatis.board.service;

import java.util.ArrayList;

import com.study.mybatis.board.vo.Board;
import com.study.mybatis.common.vo.PageInfo;

public interface BoardService {
	
	int selectTotalRecord();
	
	ArrayList<Board> selectList(PageInfo pi);
}
