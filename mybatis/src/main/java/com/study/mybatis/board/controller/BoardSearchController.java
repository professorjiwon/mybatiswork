package com.study.mybatis.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import com.study.mybatis.board.service.*;
import com.study.mybatis.board.vo.Board;
import com.study.mybatis.common.template.Pagination;
import com.study.mybatis.common.vo.PageInfo;

public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyField = request.getParameter("keyField");
		String keyword = request.getParameter("keyword");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		// 1. keyField와 keyword 2개를 모두 담을 bean객체를 만들어 넘기는 방법
		// 2. keyField와 keyword 2개를 HashMap<key,value>에 담아 넘기는 방법
		HashMap<String, String> map = new HashMap();
		map.put("keyField", keyField);
		map.put("keyword", keyword);
		
		BoardService bService = new BoardServiceImpl();
		int searchCount = bService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, nowPage, 5, 3);
		
		ArrayList<Board> list = bService.selectSearchList(map, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.setAttribute("keyField", keyField);
		request.setAttribute("keyword", keyword);
		
		request.getRequestDispatcher("WEB-INF/views/board/boardListView.jsp").forward(request, response);
	}

}








