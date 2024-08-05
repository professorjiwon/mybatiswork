<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBatis main</title>
<style>
    .login-area a {
        text-decoration: none;
        color: black;
        font-size: 12px;
        cursor: pointer;
    }
    .nav-area{
    	margin-top: 20px;
        background-color: black;
        color: white;
        height: 50px;
    }
    .menu {
        display: inline-block;
        width: 24.6%;
        line-height: 50px;
        font-size: 16px;
        font-weight: bold;
    }
    .menu:hover {
        background-color: gray;
        cursor: pointer;
    }
   /*  menubar.jsp */
    .outer {
        width: 900px;
        margin: 0 auto;
    }
</style>
</head>
<body>
    <h1 align="center">Welcom to MyBatis</h1>

    <div class="login-area" align="right">
    	<c:choose>  		
    		<c:when test="${ empty loginUser }">
    			<!-- 로그인 전 -->
		        <form action="login.me" method="post">
		            <table>
		                <tr>
		                    <td>아이디</td>
		                    <td><input name="userId" required></td>
		                    <td rowspan="2"><button style="height:50px;">로그인</button></td>
		                </tr>
		                <tr>
		                    <td>비밀번호</td>
		                    <td><input type="password" name="userPwd" required></td>
		                </tr>
		                <tr>
		                    <td colspan="3" style="text-align:center;">
		                        <a href="enrollForm.me">회원가입</a>&emsp;&emsp;
		                        <a href="">아이디/비밀번호 찾기</a>
		                    </td>
		                </tr>
		            </table>
		        </form>
			</c:when>
			<c:otherwise>
				<!-- 로그인 후 -->
			    <div>
			        <table>
			            <tr>
			                <td colspan="2">
			                    <h3>${ loginUser.userName }님 환영합니다</h3>
			                </td>
			            </tr>
			            <tr>
			                <td><a href="">마이페이지</a></td>
			                <td><a href="logout.me">로그아웃</a></td>
			            </tr>
			        </table>
			    </div>
    		</c:otherwise>
		</c:choose>
	</div>

    <nav class="nav-area" align="center">
        <div class="menu">HOME</div>
        <div class="menu">공지사항</div>
        <div class="menu" onclick="location.href='list.bo?nowPage=1'">게시판</div>
        <div class="menu">ETC</div>
    </nav>
</body>
</html>