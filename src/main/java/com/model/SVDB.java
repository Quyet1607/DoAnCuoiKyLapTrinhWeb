package com.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.JDBCUtil;
import com.model.SV;

public class SVDB {
	public static List<SV> getAllSVByMaKhoa(String makhoa) {
        List<SV> svList = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM sv WHERE MaKhoa=?")) {
            preparedStatement.setString(1, makhoa);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                SV sv = new SV();
                sv.setMaSV(resultSet.getString("MaSV"));
                sv.setTenSV(resultSet.getString("TenSV"));
                sv.setNgaySinh(resultSet.getString("NgaySinh"));
                sv.setGioiTinh(resultSet.getString("GioiTinh"));
                sv.setQueQuan(resultSet.getString("QueQuan"));
                sv.setMaKhoa(resultSet.getString("MaKhoa"));
                sv.setMaLop(resultSet.getString("MaLop"));
                sv.setKhoaHoc(resultSet.getInt("KhoaHoc"));

                svList.add(sv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return svList;
    }
	public static void insertSV(SV sv) {
		try (Connection connection = JDBCUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "INSERT INTO SV (MaSV, TenSV, NgaySinh, GioiTinh, QueQuan, MaKhoa, MaLop, KhoaHoc) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {
				preparedStatement.setString(1, sv.getMaSV());
				preparedStatement.setString(2, sv.getTenSV());
				preparedStatement.setString(3, sv.getNgaySinh());
				preparedStatement.setString(4, sv.getGioiTinh());
				preparedStatement.setString(5, sv.getQueQuan());
				preparedStatement.setString(6, sv.getMaKhoa());
				preparedStatement.setString(7, sv.getMaLop());
				preparedStatement.setInt(8, sv.getKhoaHoc());

				preparedStatement.executeUpdate();
				

	        } catch (SQLException e) {
	            System.err.println("Error connecting to the database: " + e.getMessage());
	            e.printStackTrace();
	        }
    }
	public static boolean updateSVByMaSV(String masv, SV sv, String makhoa) {
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE SV SET TenSV=?, NgaySinh=?, GioiTinh=?, QueQuan=?, MaKhoa=?, MaLop=?, KhoaHoc=? WHERE MaSV=?")) {
            preparedStatement.setString(1, sv.getTenSV());
            preparedStatement.setString(2, sv.getNgaySinh());
            preparedStatement.setString(3, sv.getGioiTinh());
            preparedStatement.setString(4, sv.getQueQuan());
            preparedStatement.setString(5, makhoa);
            preparedStatement.setString(6, sv.getMaLop());
            preparedStatement.setInt(7, sv.getKhoaHoc());
            preparedStatement.setString(8, sv.getMaSV());

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
	
	public static boolean deleteSVByMaSV(String masv) {
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM SV WHERE MaSV=?")) {
            preparedStatement.setString(1, masv);

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
	
	public static String getTenSVByMaSV(String masv) {
        String tensv = null;

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT TenSV FROM sv WHERE MaSV = ?")) {
            preparedStatement.setString(1, masv);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                tensv = resultSet.getString("TenSV");
                System.out.println(tensv);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tensv;
    }
}
