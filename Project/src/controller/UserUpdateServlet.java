package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		UserDao userDao = new UserDao();
		User user = userDao.detailUser(id);

		request.setAttribute("user", user);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/update.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String userName = request.getParameter("userName");
		String birthDate = request.getParameter("birthDate");
		String id = request.getParameter("id");


		if (!password.equals(password2)||userName.equals("")||birthDate.equals("")) {
			request.setAttribute("errMsg", "入力された内容は正しくありません。");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/update.jsp");
			dispatcher.forward(request, response);
			return;
		}

		if(password.equals("")&&password2.equals("")) {

			UserDao userDao = new UserDao();
			userDao.updateUser2(userName, birthDate, id);

			response.sendRedirect("UserListServlet");
			return;


		}



		UserDao userDao = new UserDao();
		userDao.updateUser(password, userName, birthDate, id);



		response.sendRedirect("UserListServlet");

	}

}
