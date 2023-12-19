package com.model;

public class admin {
		private String email;
		private String password;
		private String makhoa;
		public admin() {
			super();
		}
		public admin(String email, String password, String makhoa) {
			super();
			this.email = email;
			this.password = password;
			this.makhoa = makhoa;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getMakhoa() {
			return makhoa;
		}
		public void setMakhoa(String makhoa) {
			this.makhoa = makhoa;
		}
}
