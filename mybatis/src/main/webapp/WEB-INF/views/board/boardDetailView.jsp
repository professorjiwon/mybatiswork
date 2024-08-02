<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
	table {
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
				<td width="500"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>db제목</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>3</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>2024-08-02</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="100">DB내용</td>
			</tr>
		</table>
		<table border="1">
			<tr>
				<th width="100">댓글작성</th>
				<th width="400"><textarea cols="53" rows="3"></textarea></th>
				<th width="100"><button>등록</button></th>
			</tr>
			<tr>
				<th colspan="3" style="text-align:center">댓글(2)</th>
			</tr>
			<tr>
				<td>admin</td>
				<td>우와 멋져요</td>
				<td>2022-12-20</td>
			</tr>
			<tr>
				<td>user02</td>
				<td>ㅋㅋㅋ</td>
				<td>2022-12-17</td>
			</tr>
		</table>
	</div>
</body>
</html>