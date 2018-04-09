<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>ユーザー情報詳細参照</title>
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
		<h1 class="title-area">ユーザー情報詳細参照</h1>


		<div class="form-group row">
			<label for="code" class="col-sm-6 col-form-label">ログインID</label>
			<div class="col-sm-6">
				<label for="code" class="col-sm-6 col-form-label">${user.loginId}</label>
			</div>
		</div>

		<div class="form-group row">
			<label for="name" class="col-sm-6 col-form-label">ユーザー名</label>
			<div class="col-sm-6">
				<label for="name" class="col-sm-6 col-form-label">${user.name}</label>
			</div>
		</div>

		<div class="form-group row">
			<label for="continent" class="col-sm-6 col-form-label">生年月日</label>
			<div class="col-sm-6">
				<label for="continent" class="col-sm-6 col-form-label">${user.birthDate}</label>
			</div>
		</div>

		<div class="form-group row">
			<label for="time" class="col-sm-6 col-form-label">登録日時</label>
			<div class="col-sm-6">
				<label for="time" class="col-sm-6 col-form-label">${user.createDate}</label>
			</div>
		</div>

		<div class="form-group row">
			<label for="time" class="col-sm-6 col-form-label">更新日時</label>
			<div class="col-sm-6">
				<label for="time" class="col-sm-6 col-form-label">${user.updateDate}</label>
			</div>
		</div>





		<div class="return">
			<a href="UserListServlet">戻る</a>
		</div>


	</div>
</body>
</html>
