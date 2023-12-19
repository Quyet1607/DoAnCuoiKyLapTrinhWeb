package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.JDBCUtil;

public class HDDB {
	
	public static List<HD> getAllHDByMaKhoa(String makhoa) {
        List<HD> hdList = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM hd WHERE MaKhoa=?")) {
            preparedStatement.setString(1, makhoa);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                HD hd = new HD();
                hd.setMaHD(resultSet.getInt("MaHD"));
                hd.setDiaDiem(resultSet.getString("DiaDiem"));
                hd.setThoiGian(resultSet.getString("ThoiGian"));
                hd.setSoSV(resultSet.getInt("SoSV"));
                hd.setSoGV(resultSet.getInt("SoGV"));
                hd.setMaKhoa(resultSet.getString("MaKhoa"));

                hdList.add(hd);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hdList;
    }
	
	public static int insertHD(HD HD) {
		try (Connection connection = JDBCUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "INSERT INTO hd (DiaDiem, ThoiGian, SoSV, SoGV, MaKhoa) VALUES (?, ?, ?, ?, ?)",
	                     PreparedStatement.RETURN_GENERATED_KEYS)) {
				preparedStatement.setString(1, HD.getDiaDiem());
				preparedStatement.setString(2, HD.getThoiGian());
				preparedStatement.setInt(3, HD.getSoSV());
				preparedStatement.setInt(4, HD.getSoGV());
				preparedStatement.setString(5, HD.getMaKhoa());
				
				int affectedRows = preparedStatement.executeUpdate();
				
				if(affectedRows > 0) {
					try(ResultSet generatedKeys = preparedStatement.getGeneratedKeys()){
						if(generatedKeys.next()) {
							int generatedID = generatedKeys.getInt(1);
							HD.setMaHD(generatedID);
							System.out.println("ID vừa được tạo " + generatedID);
							return generatedID;
						} else {
							System.out.println("Không thể lấy ID được tạo.");
							return 0;
						}
					}
				}else {
					System.out.println("Thêm hội đồng thất bại");
					return 0;
				}

	        } catch (SQLException e) {
	            System.err.println("Error connecting to the database: " + e.getMessage());
	            e.printStackTrace();
	            return 0;
	        }
    }
	
	public static HD getHDByMaHD(int mahd) {
        HD hd = new HD();

        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM hd WHERE MaHD=?")) {
            preparedStatement.setInt(1, mahd);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                hd.setMaHD(resultSet.getInt("MaHD"));
                hd.setDiaDiem(resultSet.getString("DiaDiem"));
                hd.setThoiGian(resultSet.getString("ThoiGian"));
                hd.setSoSV(resultSet.getInt("SoSV"));
                hd.setSoGV(resultSet.getInt("SoGV"));
                hd.setMaKhoa(resultSet.getString("MaKhoa"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hd;
    }
	
	public static boolean deleteHDByMaHD(int mahd) {
        try (Connection connection = JDBCUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM HD WHERE MaHD=?")) {
            preparedStatement.setInt(1, mahd);

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
}
