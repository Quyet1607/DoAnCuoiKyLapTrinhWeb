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
	margin-top20px;
	position: relative;
	left: 30%;
}
.tukhoa{
	font-size: 20px;
}
.form-control{
	width: 500px;
}
</style>
</head>
<body>
	<%
	String masv = request.getParameter("masv");
	String tensv = request.getParameter("tensv");
	String ns = request.getParameter("ns");
	String gt = request.getParameter("gt");
	String quequan = request.getParameter("quequan");
	String makhoa = request.getParameter("makhoa");
	String malop = request.getParameter("malop");
	String khoahoc1 = request.getParameter("khoahoc");
	int khoahoc = Integer.parseInt(khoahoc1);
	%>
	<div class="header">
			<p class="ql">Quản lý sinh viên báo cáo mỗi kì</p>
	</div>
	
	<div class="form1">
    <form action="SuaSVServlet">
        <p style="text-align: center; font-size: 30px; color: blue;">SỬA THÔNG TIN SINH VIÊN</p>

        <label class="tukhoa"> Mã Sinh Viên:</label>
        <input type="text" name="MaSV" placeholder="Nhập mã sinh viên" class="form-control" required="required" value="<%= masv %>">

        <label class="tukhoa"> Tên Sinh Viên:</label>
        <input type="text" name="TenSV" placeholder="Nhập tên sinh viên" class="form-control" required="required" value="<%= tensv %>">

        <label class="tukhoa"> Ngày Sinh:</label>
        <input type="date" name="NgaySinh" class="form-control" required="required" value="<%= ns %>">

        <label class="tukhoa"> Giới Tính:</label>
        <div class="form-check">
            <input type="radio" name="GT" class="form-check-input" value="Nam" <%= "Nam".equals(gt) ? "checked" : "" %> required="required">
            <label class="form-check-label">Nam</label>
        </div>
        <div class="form-check">
            <input type="radio" name="GT" class="form-check-input" value="Nu" <%= "Nu".equals(gt) ? "checked" : "" %> required="required">
            <label class="form-check-label">Nữ</label>
        </div>

        <label class="tukhoa"> Quê Quán:</label>
        <input type="text" name="QueQuan" placeholder="Nhập quê quán" class="form-control" value="<%= quequan %>">

        <label class="tukhoa"> Mã Lớp:</label>
        <input type="text" name="MaLop" placeholder="Nhập mã lớp" class="form-control" value="<%= malop %>">

        <label class="tukhoa"> Khóa Học:</label>
        <input type="text" name="KhoaHoc" placeholder="Nhập khóa học" class="form-control" value="<%= khoahoc %>">

        <input type="hidden" name="makhoa" value="<%= makhoa %>">
        <input type="submit" value="Gửi" style="margin-top: 10px;" class="btn btn-outline-info">
    </form>
</div>
</body>
</html>