<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/origin/common.css">

<body>
	<div class="container login-area">





		<h1 class="title-area">ログイン画面</h1>

		<c:if test="${errMsg != null}">
			<div class="alert alert-danger" role="alert">${errMsg}</div>
		</c:if>

		<form class="form-signin" action="LoginServlet" method="post">

			<div class="form-group row">
				<label for="code" class="col-sm-2 col-form-label">ログインID</label>
				<div class="col-sm-10">
					<input type="text" name="loginId" id="login-id"
						class="form-control" />
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
				<div class="col-sm-10">
					<input type="password" name="password" class="form-control"
						id="inputPassword" placeholder="">
				</div>
			</div>




			<button type="submit" class="btn btn-outline-secondary">ログイン</button>
		</form>


	</div>
</body>
</html>
