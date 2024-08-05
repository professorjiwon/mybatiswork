package com.study.mybatis.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.study.mybatis.board.service.BoardServiceImpl;
import com.study.mybatis.board.vo.Reply;

public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Reply r = new Reply();
		r.setRefBno(Integer.parseInt(request.getParameter("bnum")));
		r.setReplyWriter(request.getParameter("userId"));
		r.setReplyContent(request.getParameter("content"));
		
		int result = new BoardServiceImpl().insertReply(r);
		
		response.getWriter().print(result);
	}

}
