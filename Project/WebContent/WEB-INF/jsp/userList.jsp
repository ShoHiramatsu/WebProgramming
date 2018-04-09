<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>ユーザー一覧</title>
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

	<div class=" container logout">



		<div class="container login-area">
			<h1 class="title-area">ユーザー一覧</h1>

			<div class="enter">
				<form action="CreateUserServlet">
					<button type="submit" class="btn btn-outline-secondary">新規登録</button>
				</form>
			</div>

			<form class="form-signin" action="UserListServlet" method="post">

				<div class="form-group row">
					<label for="code" class="col-sm-2 col-form-label">ログインID</label>
					<div class="col-sm-10">
						<input type="text" name="loginId" id="login-id"
							class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">ユーザー名</label>
					<div class="col-sm-10">
						<input type="text" name="userName" id="user-name"
							class="form-control" />
					</div>
				</div>

				<div class="form-group row">
					<label for="continent" class="col-sm-2 col-form-label">生年月日</label>
					<div class="col-sm-4">
						<input type="date" name="birthDate" id="birthDate"
							class="form-control" size="30" />
					</div>
					<div class="col-sm-2">
						<p class="code">~</P>
					</div>
					<div class="col-sm-4">
						<input type="date" name="birthDate2" id="birthDate"
							class="form-control" size="30" />
					</div>
				</div>


				<div class="enter">
					<button type="submit" class="btn btn-outline-secondary">検索</button>
				</div>
			</form>

		</div>








		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ログインID</th>
						<th>ユーザ名</th>
						<th>生年月日</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.loginId}</td>
							<td>${user.name}</td>
							<td>${user.birthDate}</td>
							<!-- TODO 未実装；ログインボタンの表示制御を行う -->
							<td><c:if test="${userInfo.loginId=='admin'}">
									<a class="btn btn-primary"
										href="UserDetailServlet?id=${user.id}">詳細</a>
									<a class="btn btn-success"
										href="UserUpdateServlet?id=${user.id}">更新</a>
									<a class="btn btn-danger"
										href="UserDeleteServlet?id=${user.id}">削除</a>
								</c:if> <c:if test="${userInfo.loginId!='admin'}">
									<a class="btn btn-primary" href="UserDetailServlet?id=${user.id}">詳細</a>
									<c:if test="${userInfo.loginId==user.loginId}">
										<a class="btn btn-success" href="UserUpdateServlet?id=${user.id}">更新</a>
									</c:if>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
</body>
</html>
