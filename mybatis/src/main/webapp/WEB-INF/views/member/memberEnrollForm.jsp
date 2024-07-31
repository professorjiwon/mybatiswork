<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll Form</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	.enroll td {height:30px;}
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<br>
		<h2 align="center">회원가입</h2>
		<form action="insert.me" method="post" id="enrollForm">
			<table align="center" class="enroll">
				<tr>
					<td>* ID</td>
					<td>
						<input name="userId" id="id" required>
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
	
	<script>
		$(() => {
			const $idInput = $("#id");
			$idInput.keyup(function() {
				if($idInput.val().length >= 5) {
					$.ajax({
						url: "idCheck.me",
						data : {id : $idInput.val()},
						success : function(result) {
							console.log(result);
							if(result == 'idN') {
								$("#checkResult").show();
								$("#checkResult").css("color","red").text("중복된 아이디가 존재합니다. 다시 입력하세요");
								$("#enrollForm :submit").attr("disabled", true);
							} else {
								$("#checkResult").show();
								$("#checkResult").css("color","green").text("멋진 아이디 입니다.");
								$("#enrollForm :submit").attr("disabled", false);
							}
						},
						error : function() {
							console.log("아이디 중복체크 ajax 통신 실패");
						}
					})
				} else {
					$("#checkResult").hide();
					$("#enrollForm :submit").attr("disabled", true);
				}
			})
		})
	</script>
</body>
</html>