package com.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.jdbc.JDBCUtil;

public class testJDBCUtil {
	public static void main(String[] args) {
		Connection connection = JDBCUtil.getConnection();

        if (connection != null) {
            System.out.println("ok");
            JDBCUtil.printInfo(connection);
            JDBCUtil.closeConnection(connection);
        } else {
            System.out.println("not ok");
        }
	}

}