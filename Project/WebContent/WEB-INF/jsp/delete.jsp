<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>ユーザー削除確認</title>
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
		<h1 class="title-area">ユーザー削除確認</h1>

		<form class="form-signin" action="UserDeleteServlet" method="post">

			<input type="hidden" name="id" value="${user.id}">

			<div class="delete">
				<p>ログインID:${user.loginId}</p>
				<p>を本当に削除してよろしいですか？</p>
			</div>

			<div class="enterMain">
				<a class="btn btn-outline-secondary" href="UserListServlet"
					role="button">キャンセル</a>
				<button type="submit" class="btn btn-outline-secondary">OK</button>
			</div>
		</form>

		<div class="return">
			<a href="UserListServlet">戻る</a>
		</div>


	</div>
</body>
</html>
