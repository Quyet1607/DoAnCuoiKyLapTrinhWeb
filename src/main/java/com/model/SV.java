package com.model;

public class SV {
	private String MaSV;
	private String TenSV;
	private String NgaySinh;
	private String GioiTinh;
	private String QueQuan;
	private String MaKhoa;
	private String MaLop;
	private int KhoaHoc;
	public SV() {
		super();
	}
	public SV(String maSV, String tenSV, String ngaySinh, String gioiTinh, String queQuan, String maKhoa, String maLop,
			int khoaHoc) {
		super();
		MaSV = maSV;
		TenSV = tenSV;
		NgaySinh = ngaySinh;
		GioiTinh = gioiTinh;
		QueQuan = queQuan;
		MaKhoa = maKhoa;
		MaLop = maLop;
		KhoaHoc = khoaHoc;
	}
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	public String getTenSV() {
		return TenSV;
	}
	public void setTenSV(String tenSV) {
		TenSV = tenSV;
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
	public String getQueQuan() {
		return QueQuan;
	}
	public void setQueQuan(String queQuan) {
		QueQuan = queQuan;
	}
	public String getMaKhoa() {
		return MaKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		MaKhoa = maKhoa;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public int getKhoaHoc() {
		return KhoaHoc;
	}
	public void setKhoaHoc(int khoaHoc) {
		KhoaHoc = khoaHoc;
	}
	
	
}
