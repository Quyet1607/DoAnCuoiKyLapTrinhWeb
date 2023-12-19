package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.JDBCUtil;
import com.model.GV;
public class GVDB {
	public static List<GV> getAllGVByMaKhoa(String makhoa) {
        List<GV> gvList = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM GV WHERE MaKhoa=?")) {
            preparedStatement.setString(1, makhoa);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                GV gv = new GV();
                gv.setMaGV(resultSet.getString("MaGV"));
                gv.setTenGV(resultSet.getString("TenGV"));
                gv.setNgaySinh(resultSet.getString("NgaySinh"));
                gv.setGioiTinh(resultSet.getString("GioiTinh"));
                gv.setEmail(resultSet.getString("Email"));
                gv.setMaKhoa(resultSet.getString("MaKhoa"));

                gvList.add(gv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return gvList;
    }
	
	public static void insertSV(GV gv) {
		try (Connection connection = JDBCUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "INSERT INTO GV (MaGV, TenGV, NgaySinh, GioiTinh, Email, MaKhoa) VALUES (?, ?, ?, ?, ?,?)")) {
				preparedStatement.setString(1, gv.getMaGV());
				preparedStatement.setString(2, gv.getTenGV());
				preparedStatement.setString(3, gv.getNgaySinh());
				preparedStatement.setString(4, gv.getGioiTinh());
				preparedStatement.setString(5, gv.getEmail());
				preparedStatement.setString(6, gv.getMaKhoa());
				preparedStatement.executeUpdate();
				

	        } catch (SQLException e) {
	            System.err.println("Error connecting to the database: " + e.getMessage());
	            e.printStackTrace();
	        }
    }
	public static boolean updateGVByMaGV(String magv, GV gv, String makhoa) {
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE GV SET TenGV=?, NgaySinh=?, GioiTinh=?, Email=?, MaKhoa=? WHERE MaGV=?")) {
            preparedStatement.setString(1, gv.getTenGV());
            preparedStatement.setString(2, gv.getNgaySinh());
            preparedStatement.setString(3, gv.getGioiTinh());
            preparedStatement.setString(4, gv.getEmail());
            preparedStatement.setString(5, makhoa);
            preparedStatement.setString(6, gv.getMaGV());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Cập nhật thành công");
            } else {
            	System.out.println("Cập nhật thất bại");
            }
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	
	public static boolean deleteGVByMaGV(String magv) {
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM GV WHERE MaGV=?")) {
            preparedStatement.setString(1, magv);

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Xóa dữ liệu thành công");
            } else {
                System.out.println("Không có dữ liệu nào được xóa");
            }
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
	}
	
	public static String getTenGVByMaGV(String magv) {
        String tengv = null;

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT TenGV FROM GV WHERE MaGV = ?")) {
            preparedStatement.setString(1, magv);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                tengv = resultSet.getString("TenGV");
                System.out.println(tengv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tengv;
    }
}
