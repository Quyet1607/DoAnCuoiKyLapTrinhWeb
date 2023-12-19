package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.JDBCUtil;

public class pcgvDB {
	public static List<pcgv> getAllMaGVByMaHD(int mahd) {
        List<pcgv> pcgvList = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM pcgv WHERE MaHD=?")) {
            preparedStatement.setInt(1, mahd);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                pcgv pcgv = new pcgv();
                pcgv.setMaHD(resultSet.getInt("MaHD"));
                pcgv.setMaGV(resultSet.getString("MaGV"));
                
                pcgvList.add(pcgv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pcgvList;
    }
	
	public static void insertPCGV(pcgv pcgv) {
		try (Connection connection = JDBCUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "INSERT INTO pcgv (MaHD, MaGV) VALUES (?, ?)")) {
				preparedStatement.setInt(1, pcgv.getMaHD());
				preparedStatement.setString(2, pcgv.getMaGV());

				preparedStatement.executeUpdate();
				

	        } catch (SQLException e) {
	            System.err.println("Error connecting to the database: " + e.getMessage());
	            e.printStackTrace();
	        }
    }
}
