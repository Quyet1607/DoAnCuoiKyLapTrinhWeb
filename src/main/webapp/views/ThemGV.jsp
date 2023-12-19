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
	left: 30%;
}
.tukhoa{
	font-size: 20px;
}
.onhap{
	font-size: 20px;
	margin-left: 10px;
}
.form-control{
	width: 500px;
}
</style>
</head>
<body>
	<%
		String makhoa = request.getParameter("makhoa");
	%>
	<div class="header">
		<table>
			<td class="ql">Quản lý sinh viên báo cáo mỗi kì</td>
			<td>
				<form action="GV.jsp">
					<input type="hidden" name="makhoa" value="<%=makhoa%>">
					<input type="submit" class="nav-link" value="Danh sách giảng viên">
				</form>
			</td>
		</table>
	</div>
	
	<div class="form1">
		<form action="themGVServlet">
        <p style="text-align: center; font-size: 30px; color: blue;">THÊM GIẢNG VIÊN MỚI</p>
        <label class="tukhoa"> Mã Giảng Viên:</label>
        <input type="text" name="MaGV" placeholder="Nhập mã Giảng viên" class="form-control" required="required">

        <label class="tukhoa"> Tên Giảng Viên:</label>
        <input type="text" name="TenGV" placeholder="Nhập tên Giảng viên" class="form-control" required="required">

        <label class="tukhoa"> Ngày Sinh:</label>
        <input type="date" name="NgaySinh" class="form-control" required="required">

        <label class="tukhoa"> Giới Tính:</label>
        <div class="form-check">
            <input type="radio" name="GT" class="form-check-input" value="Nam" required="required" id="namRadio">
            <label class="form-check-label" for="namRadio">Nam</label>
        </div>
        <div class="form-check">
            <input type="radio" name="GT" class="form-check-input" value="Nu" required="required" id="nuRadio">
            <label class="form-check-label" for="nuRadio">Nữ</label>
        </div>

        <label class="tukhoa"> Email:</label>
        <input type="email" name="Email" placeholder="Nhập Email" class="form-control">

		</br>
        <input type="hidden" name="makhoa" value="<%=makhoa%>">
        <input type="submit" value="Lưu" class="btn btn-outline-info" style="position: relative; left: 40%;">
    </form>
	</div>
</body>
</html>