package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.JDBCUtil;

public class pcsvDB {
	public static List<pcsv> getAllMaSVByMaHD(int mahd) {
        List<pcsv> pcsvList = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM pcsv WHERE MaHD=?")) {
            preparedStatement.setInt(1, mahd);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                pcsv pcsv = new pcsv();
                pcsv.setMaHD(resultSet.getInt("MaHD"));
                pcsv.setMaSV(resultSet.getString("MaSV"));
                
                pcsvList.add(pcsv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pcsvList;
    }
	public static void insertPCSV(pcsv pcsv) {
		try (Connection connection = JDBCUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "INSERT INTO pcsv (MaHD, MaSV) VALUES (?, ?)")) {
				preparedStatement.setInt(1, pcsv.getMaHD());
				preparedStatement.setString(2, pcsv.getMaSV());

				preparedStatement.executeUpdate();
				

	        } catch (SQLException e) {
	            System.err.println("Error connecting to the database: " + e.getMessage());
	            e.printStackTrace();
	        }
    }
}
