package com.model;

public class HD {
	private int MaHD;
	private String DiaDiem;
	private String ThoiGian;
	private int SoSV;
	private int SoGV;
	private String MaKhoa;
	public HD() {
		super();
	}
	public HD(int maHD, String diaDiem, String thoiGian, int soSV, int soGV, String maKhoa) {
		super();
		MaHD = maHD;
		DiaDiem = diaDiem;
		ThoiGian = thoiGian;
		SoSV = soSV;
		SoGV = soGV;
		MaKhoa = maKhoa;
	}
	
	public int getMaHD() {
		return MaHD;
	}
	public void setMaHD(int maHD) {
		MaHD = maHD;
	}
	public String getDiaDiem() {
		return DiaDiem;
	}
	public void setDiaDiem(String diaDiem) {
		DiaDiem = diaDiem;
	}
	public String getThoiGian() {
		return ThoiGian;
	}
	public void setThoiGian(String thoiGian) {
		ThoiGian = thoiGian;
	}
	public int getSoSV() {
		return SoSV;
	}
	public void setSoSV(int soSV) {
		SoSV = soSV;
	}
	public int getSoGV() {
		return SoGV;
	}
	public void setSoGV(int soGV) {
		SoGV = soGV;
	}
	public String getMaKhoa() {
		return MaKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		MaKhoa = maKhoa;
	}
}
