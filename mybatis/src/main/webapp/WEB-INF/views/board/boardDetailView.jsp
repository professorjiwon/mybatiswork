<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
	.outer table {
		border:2px solid ;
		border-collapse : collapse;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer" align="center">
		<h1 align="center">게시판 상세조회</h1>
		
		<table border="1">
			<tr>
				<td width="100">글번호</td>
				<td width="500">${ b.boardNo }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${ b.boardTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${ b.boardWriter }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${ b.count }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${ b.createDate }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="100">${ b.boardContent }</td>
			</tr>
		</table>
		<br>
		<table border="1">
			<tr>
				<th width="100">댓글작성</th>
				<th width="400"><textarea cols="53" rows="3"></textarea></th>
				<th width="100"><button>등록</button></th>
			</tr>
			<tr>
				<th colspan="3" style="text-align:center">댓글(${rlist.size()})</th>
			</tr>
			
			<c:forEach var="r" items="${rlist}">
				<tr>
					<td>${r.replyWriter}</td>
					<td>${r.replyContent}</td>
					<td>${r.createDate.substring(0,10)}</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>