<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<h1 align="center">게 시 판</h1>
		
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${ list }">
					<tr>
						<td>${ b.boardNo }</td>
						<td>${ b.boardTitle }</td>
						<td>${ b.boardWriter }</td>
						<td>${ b.count }</td>
						<td>${ b.createDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div>
			<c:if test="${ pi.nowPage ne 1 }">
				<a href="list.bo?nowPage=${ pi.nowPage - 1 }">[이전]</a>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end = "${ pi.endPage }">
				<a href="list.bo?nowPage=${p}">[${p}]</a>
			</c:forEach>
			
			<c:if test="${ pi.nowPage ne pi.totalPage }">
				<a href="list.bo?nowPage=${ pi.nowPage + 1 }">[다음]</a>
			</c:if>
		</div>
		
		<div>
			<form action="search.bo">
				<select name="keyField">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input name="keyword">
				<button>검색</button>
				<input type="hidden" name="nowPage" value="1">
			</form>
		</div>
	</div>
</body>
</html>






