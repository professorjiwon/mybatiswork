<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Form</title>
<style>
	.enroll td {height:30px;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<br>
		<h2 align="center">회원가입</h2>
		<form action="" method="post" id="enrollForm">
			<table align="center" class="enroll">
				<tr>
					<td>* ID</td>
					<td>
						<input name="userId" required>
						<div id="checkResult" style="font-size: 0.8em; display: none;"></div>
					</td>
				</tr>
				<tr>
					<td>* PWD</td>
					<td><input type="password" name="userPwd" required></td>
				</tr>
				<tr>
					<td>* NAME</td>
					<td><input name="userName" required></td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>BIRTHDAY</td>
					<td><input name="birthday" placeholder="생년월일(6자리)"></td>
				</tr>
				<tr>
					<td>GENDER</td>
					<td>
						<input type="radio" name="gender" value="M">남&emsp;
						<input type="radio" name="gender" value="F">여
					</td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td><input name="phone" required></td>
				</tr>
				<tr>
					<td>ADDRESS</td>
					<td><input name="address" required></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="reset" value="초기화">&emsp;
						<input type="submit" value="회원가입">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>