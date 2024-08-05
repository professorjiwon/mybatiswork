<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<style>
	#list-area {
		border:1px solid ;
		text-align:center;
		border-collapse : collapse;
	}
	#list-area th, #list-area td {height: 30px;}
	.outer a {
		color:black;
		text-decoration:none;
	}
	#paging-area {
		margin: 10px 0;
	}
	#search-area select{
		font-size:14px;
		padding: 5px 10px;
	}
	#search-area input {
		padding: 5px 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer" align="center">
		<h1 align="center">게 시 판</h1>
		
		<table id="list-area" border="1">
			<thead>
				<tr>
					<th width="80px;">글번호</th>
					<th width="400px;">제목</th>
					<th width="100px;">작성자</th>
					<th width="80px;">조회수</th>
					<th width="120px;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${ list }" varStatus="s">
					<tr>
						<td>${pi.totalRecord-((pi.nowPage-1)*pi.numPerPage)-s.index}</td>
						<td style="text-align: left; padding-left: 10px;">
							<a href="detail.bo?bno=${b.boardNo}">${ b.boardTitle }</a>
						</td>
						<td>${ b.boardWriter }</td>
						<td>${ b.count }</td>
						<td>${ b.createDate.substring(0,10) }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div id="paging-area">
			<c:if test="${ pi.nowPage ne 1 }">
				<c:choose>
					<c:when test="${empty keyField}">
						<a href="list.bo?nowPage=${ pi.nowPage - 1 }">[이전]</a>
					</c:when>
					<c:otherwise>
						<a href="search.bo?nowPage=${pi.nowPage-1}&keyField=${keyField}&keyword=${keyword}">[이전]</a>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end = "${ pi.endPage }">
				<c:choose>
					<c:when test="${empty keyField}">
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<a href="list.bo?nowPage=${p}" style="color:lightskyblue">[${p}]</a>
							</c:when>
							<c:otherwise>
								<a href="list.bo?nowPage=${p}">[${p}]</a>
							</c:otherwise>	
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<a href="search.bo?nowPage=${p}&keyField=${keyField}&keyword=${keyword}" style="color:lightskyblue">[${p}]</a>
							</c:when>
							<c:otherwise>
								<a href="search.bo?nowPage=${p}&keyField=${keyField}&keyword=${keyword}">[${p}]</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${ pi.nowPage ne pi.totalPage }">
				<c:choose>
					<c:when test="${empty keyField}">
						<a href="list.bo?nowPage=${pi.nowPage+1}">[다음]</a>
					</c:when>
					<c:otherwise>
						<a href="search.bo?nowPage=${pi.nowPage+1}&keyField=${keyField}&keyword=${keyword}">[다음]</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
		
		<div id="search-area">
			<form action="search.bo">
				<select name="keyField">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input name="keyword" value="${ keyword }">
				<input type="submit" value="검색">
				<input type="hidden" name="nowPage" value="1">
			</form>
		</div>
	</div>
</body>
</html>