package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.Common;
import model.User;

public class UserDao {

	public User findByLoginInfo(String loginId, String password) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, loginId);
			pStmt.setString(2, Common.convertPassword(password));
			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}

			String loginIdData = rs.getString("login_id");
			String nameData = rs.getString("name");
			return new User(loginIdData, nameData);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
	}

	public List<User> findAll() {
		Connection conn = null;
		List<User> userList = new ArrayList<User>();

		try {

			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user where login_id!='admin'";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return userList;
	}

	public List<User> findSearch(String inputLoginId, String inputUserName, String inputBirthDate, String inputBirthDate2) {
		Connection conn = null;
		List<User> userList = new ArrayList<User>();

		try {

			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user where login_id!='admin'";

			if(!inputLoginId.equals("")) {
				sql += " and login_id = '" + inputLoginId+"'";
			}
			if(!inputUserName.equals("")) {
				sql += "  and name LIKE  '%"+ inputUserName  +"%'";
			}
			if(!inputBirthDate.equals("")) {
				sql += " and birth_date >='"+ inputBirthDate +"'";
			}

			if(!inputBirthDate2.equals("")) {
				sql += " and birth_date <='"+ inputBirthDate2 +"'";
			}




			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return userList;
	}

	public void createUser(String loginId, String password, String userName, String birthDate) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "INSERT INTO user(login_id,password,name,birth_date,create_date,update_date) VALUES (?,?,?,?,now(), now())";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, loginId);
			pStmt.setString(2, Common.convertPassword(password));
			pStmt.setString(3, userName);
			pStmt.setString(4, birthDate);
			pStmt.executeUpdate();



		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();

				}
			}
		}
	}

	public void updateUser(String password, String userName, String birthDate, String id) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "UPDATE user SET password = ?, name =?, birth_date =?, update_date = now() WHERE id=?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, Common.convertPassword(password));
			pStmt.setString(2, userName);
			pStmt.setString(3, birthDate);
			pStmt.setString(4, id);
			pStmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();

				}
			}
		}
	}
	public void updateUser2(String userName, String birthDate, String id) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "UPDATE user SET  name =?, birth_date =?, update_date = now() WHERE id=?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, userName);
			pStmt.setString(2, birthDate);
			pStmt.setString(3, id);
			pStmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();

				}
			}
		}
	}

	public void deleteUser(String id) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "DELETE FROM user where id =?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);
			pStmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();

				}
			}
		}
	}

	public User detailUser(String id) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user WHERE id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);
			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}
			int id1 = rs.getInt("id");
			String loginId = rs.getString("login_id");
			String name = rs.getString("name");
			Date birthDate = rs.getDate("birth_date");
			String password = rs.getString("password");
			String createDate = rs.getString("create_date");
			String updateDate = rs.getString("update_date");
			User user = new User(id1, loginId, name, birthDate, password, createDate, updateDate);
			return user;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
	}

	public boolean findUser(String loginId) {
		Connection conn = null;
		try {

			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user WHERE login_id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, loginId);
			ResultSet rs = pStmt.executeQuery();


			if (rs.next()) {
				return true;
			}




			return false;


		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
			}
		}
	}
}
