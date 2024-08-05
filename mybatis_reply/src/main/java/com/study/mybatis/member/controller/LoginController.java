package com.study.mybatis.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.study.mybatis.member.sevice.MemberServiceImpl;
import com.study.mybatis.member.vo.Member;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = new Member();
		m.setUserId(request.getParameter("userId"));
		m.setUserPwd(request.getParameter("userPwd"));
		
		Member loginUser = new MemberServiceImpl().loginMember(m);
		
		if(loginUser == null) {  // 로그인 실패
			request.setAttribute("errorMsg", "로그인 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		} else {  // 로그인 성공
			request.getSession().setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
			System.out.println("request.getContextPath() : " + request.getContextPath());
		}
	}
}