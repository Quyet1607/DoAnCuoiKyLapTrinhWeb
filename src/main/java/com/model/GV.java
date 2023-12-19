package com.model;

public class GV {
	private String MaGV;
	private String TenGV;
	private String NgaySinh;
	private String GioiTinh;
	private String Email;
	private String MaKhoa;
	public GV() {
		super();
	}
	public GV(String maGV, String tenGV, String ngaySinh, String gioiTinh, String email, String maKhoa) {
		super();
		MaGV = maGV;
		TenGV = tenGV;
		NgaySinh = ngaySinh;
		GioiTinh = gioiTinh;
		Email = email;
		MaKhoa = maKhoa;
	}
	public String getMaGV() {
		return MaGV;
	}
	public void setMaGV(String maGV) {
		MaGV = maGV;
	}
	public String getTenGV() {
		return TenGV;
	}
	public void setTenGV(String tenGV) {
		TenGV = tenGV;
	}
	public String getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMaKhoa() {
		return MaKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		MaKhoa = maKhoa;
	}
}
