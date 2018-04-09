<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>ユーザー情報更新</title>
</head>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/origin/common.css">

<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark nav-item">
		<div class="navbar-nav mr-auto"></div>
		<a class="nav-link active" href="#">${user.name} さん</a>
		<div class="navbar-logout">
			<a class="nav-link active" href="LogoutServlet">ログアウト</a>
		</div>
	</nav>


	<div class="container login-area">
		<h1 class="title-area">ユーザー情報更新</h1>

		<c:if test="${errMsg != null}">
			<div class="alert alert-danger" role="alert">${errMsg}</div>
		</c:if>

		<form class="form-signin" action="UserUpdateServlet" method="post">

			<input type="hidden" name="id" value="${user.id}">

			<div class="form-group row">
				<label for="code" class="col-sm-6 col-form-label">ログインID</label>
				<div class="col-sm-6">
					<label for="code" name="loginId" class="col-sm-6 col-form-label">${user.loginId}</label>

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

					<input type="text" name="userName" class="form-control"
						id="user-name" placeholder="" value="${user.name}" />

				</div>
			</div>

			<div class="form-group row">
				<label for="continent" class="col-sm-6 col-form-label">生年月日</label>
				<div class="col-sm-6">


					<input type="date" name="birthDate" class="form-control"
						id="date-start" placeholder="" size="30" value="${user.birthDate}" />
				</div>
			</div>




			<button type="submit" class="btn btn-outline-secondary">更新</button>
		</form>
		<div class="return">
			<a href="UserListServlet">戻る</a>
		</div>


	</div>
</body>
</html>
