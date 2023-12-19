<%@page import="com.model.SVDB"%>
<%@page import="com.model.SV"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sinh viên báo cáo mỗi kỳ</title>
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
	.sv{
		margin-top: 40px;
		font-size: 30px;
	}
	.btn-success{
		margin-bottom: 20px;
		font-size: 20px;
	}
	.table-bordered{
		width: 95%;
		margin-left: 40px;
	}
	.btn-outline-info{
		position: relative;
		left: 15px;
	}
</style>
</head>
<body>
	
	<%
		String makhoa = request.getParameter("makhoa");
		int mahd = (int)session.getAttribute("mahd");
	%>
	<div class="header">
		<p class="ql">Quản lý sinh viên báo cáo mỗi kỳ</p>
	</div>
	<div class="container">
		<h1><center>THÊM SINH VIÊN VÀO HỘI ĐỒNG</center></h1>
	
	<table class="table table-bordered">
        	<thead class="thead-light">
        		<tr>
        			<th scope="col">Mã Sinh Viên</th>
        			<th scope="col">Tên Sinh Viên</th>
        			<th scope="col">Ngày Sinh</th>
        			<th scope="col">Giới Tính</th>
        			<th scope="col">Quê Quán</th>
        			<th scope="col">Mã Khoa</th>
        			<th scope="col">Mã Lớp</th>
        			<th scope="col">Khóa Học</th>
        			<th scope="col"></th>
        		</tr>
        	</thead>
        	<tbody>
        		<%
        			List<SV> sv = SVDB.getAllSVByMaKhoa(makhoa);
        			for ( SV sv1 : sv){
        		%>
        		<tr>
        			<td><%= sv1.getMaSV() %></td>
        			<td><%= sv1.getTenSV() %></td>
        			<td><%= sv1.getNgaySinh() %></td>
        			<td><%= sv1.getGioiTinh() %></td>
        			<td><%= sv1.getQueQuan() %></td>
        			<td><%= sv1.getMaKhoa() %></td>
        			<td><%= sv1.getMaLop() %></td>
        			<td><%= sv1.getKhoaHoc() %></td>
        			<td>
        				<form action="ThempcsvServlet">
        					<input type="hidden" name="mahd" value="<%= mahd%>">
        					<input type="hidden" name="makhoa" value="<%= sv1.getMaKhoa() %>">
        					<input type="hidden" name="masv" value="<%= sv1.getMaSV() %>">
							<input class="btn btn-outline-info" type="submit" value="Chọn sinh viên">
        				</form>
        			</td>
        		</tr>
        		<%} %>
        	</tbody>
        </table>
        
        <form action="ThemGVHD.jsp">
        	<input type="hidden" name="mahd" value="<%= mahd%>">
        	<input type="hidden" name="makhoa" value="<%= makhoa %>">
        	<input type="submit" class="btn btn-outline-info" value="Lưu sinh viên">
        </form>
        
        </div>
</body>
</html>