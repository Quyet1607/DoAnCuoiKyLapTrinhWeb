<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sinh viên báo cáo mỗi kì</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
.header {
	font-size: 30px;
	font-style: Time new roman;
	background-color: blue;
	color: white;
}

.ql {
	margin-left: 10px;
}

.nav-link{
	background-color: blue;
	border: none;
	color: #A9A9A9;
	font-size: 20px;
	padding-left: 20px;
	padding-top: 10px;
	cursor: pointer;
}
.nav-link:hover {
        color: white;
}

.form1{
	width: 35%;
	height: 50%;
	display: flex;
	justify-content: center;
	margin-top: 20px;
	position: relative;
	left: 32%;
}
.tukhoa{
	font-size: 30px;
}
.onhap{
	font-size: 20px;
	margin-left: 10px;
}
.form-control{
	width: 800px;
	font-size: 30px;
}
.btn-outline-info{
	margin-top: 20px;
	font-size: 30px;
}
</style>
</head>
<body>
	<%
	String makhoa = request.getParameter("makhoa");
	%>
	<div class="header">
		<p class="ql">Quản lý sinh viên báo cáo mỗi kì</p>
	</div>
	
	<div class="form1">
		<form action="ThemHDServlet">
			<p style="text-align: center; font-size: 50px; color: blue;">THÊM HỘI ĐỒNG MỚI</p>
			<label class="tukhoa">Nhập địa điểm</label>
			<input type="text" class="form-control" name="diadiem" placeholder="Nhập địa điểm" required="required">
			<label class="tukhoa">Chọn thời gian</label>
			<label class="tukhoa">Chọn ngày:</label>
			<input class="form-control" type="date" name="thoigian1" required="required">
			<label class="tukhoa">Chọn giờ:</label>
			<input class="form-control" type="time" name="thoigian2" required="required">
			<input type="hidden" name="makhoa" value="<%= makhoa %>">
			<input type="submit" class="btn btn-outline-info" value="Thêm" >
		</form>
	</div>
</body>
</html>