package com.study.mybatis.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.study.mybatis.board.service.*;
import com.study.mybatis.board.vo.Board;
import com.study.mybatis.board.vo.Reply;

public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		BoardService bService = new BoardServiceImpl();
		
		// 1. 조회수 증가
		int result = bService.increaseCount(boardNo);
		
		
		if(result > 0) {
			// 2. 상세 조회
			Board b = bService.selectBoard(boardNo);
			
			// 3. 해당글에 달린 댓글 리스트 조회
			ArrayList<Reply> rlist = bService.selectReplyList(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("rlist", rlist);
			
			request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "상세조회 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

}
