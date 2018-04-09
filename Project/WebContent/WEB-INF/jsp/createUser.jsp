<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>新規登録</title>
</head>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/origin/common.css">

<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark nav-item">
		<div class="navbar-nav mr-auto"></div>
		<a class="nav-link active" href="#">${userInfo.name} さん</a>
		<div class="navbar-logout">
			<a class="nav-link active" href="LogoutServlet">ログアウト</a>
		</div>
	</nav>


	<div class="container login-area">
		<h1 class="title-area">ユーザー新規登録</h1>

		<c:if test="${errMsg != null}">
			<div class="alert alert-danger" role="alert">${errMsg}</div>
		</c:if>

		<form class="form-signin" action="CreateUserServlet" method="post">

			<div class="form-group row">
				<label for="code" class="col-sm-6 col-form-label">ログインID</label>
				<div class="col-sm-6">
					<input type="text" name="loginId" id="login-id"
						class="form-control" />
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-6 col-form-label">パスワード</label>
				<div class="col-sm-6">
					<input type="password" name="password" class="form-control"
						id="inputPassword" placeholder="">
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-6 col-form-label">パスワード（確認）</label>
				<div class="col-sm-6">
					<input type="password" name="password2" class="form-control"
						id="inputPassword" placeholder="">
				</div>
			</div>

			<div class="form-group row">
				<label for="name" class="col-sm-6 col-form-label">ユーザー名</label>
				<div class="col-sm-6">
					<input type="text" name="userName" id="user-name"
						class="form-control" />
				</div>
			</div>

			<div class="form-group row">
				<label for="continent" class="col-sm-6 col-form-label">生年月日</label>
				<div class="col-sm-6">
					<input type="date" name="birthDate" id="birth_Date"
						class="form-control" size="30" />
				</div>
			</div>




			<button type="submit" class="btn btn-outline-secondary">送信</button>
		</form>
		<div class="return">
			<a href="UserListServlet">戻る</a>
		</div>




	</div>
</body>
</html>
