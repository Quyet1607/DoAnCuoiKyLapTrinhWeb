package com.model;

import java.sql.*;

import com.model.admin;
import com.jdbc.JDBCUtil;

public class adminDB {
	public boolean validayte(admin ad) {
		boolean status = false;
		try (Connection connection = JDBCUtil.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from admin where email = ? and password = ?")) {
			preparedStatement.setString(1, ad.getEmail());
			preparedStatement.setString(2, ad.getPassword());
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				status = resultSet.next();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static String GetMaKhoaByemail(String email) {
		String makhoa = null;
		try (Connection connection = JDBCUtil.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("select MaKhoa from admin where email = ?")) {
			preparedStatement.setString(1, email);

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				makhoa = resultSet.getString("MaKhoa");
				System.out.println(makhoa);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return makhoa;
	}
}