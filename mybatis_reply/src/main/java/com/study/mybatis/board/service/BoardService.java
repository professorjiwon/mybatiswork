package com.study.mybatis.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.study.mybatis.board.vo.Board;
import com.study.mybatis.board.vo.Reply;
import com.study.mybatis.common.vo.PageInfo;

public interface BoardService {
	// 게시판 리스트 조회
	int selectTotalRecord();	
	ArrayList<Board> selectList(PageInfo pi);
	
	// 상세조회
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 게시글 검색
	int selectSearchCount(HashMap<String, String> map);
	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// 댓글 등록
	int insertReply(Reply r);
}




