<%@page import="com.model.GVDB"%>
<%@page import="com.model.GV"%>
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
	.header{
		font-size: 30px;
		font-style: Time new roman;
		background-color: blue;
		color: white;
		height: 60px;
	}

	.gv{
		margin-top: 40px;
		font-size: 30px;
	}
	.btn-success{
		margin-bottom: 20px;
		font-size: 20px;
	}
	.table-bordered{
		width: 95%;
		margin-left: 40px
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
		int mahd = Integer.parseInt(request.getParameter("mahd"));
	%>
	<div class="header">
		<p class="ql">Quản lý sinh viên báo cáo mỗi kỳ</p>
	</div>
	
	<div class="container">
		<h1><center>THÊM GIẢNG VIÊN VÀO HỘI ĐỒNG</center></h1>
		<table class="table table-bordered">
        	<thead class="thead-light">
        		<tr>
        			<th scope="col">Mã Giảng Viên</th>
        			<th scope="col">Tên Giảng Viên</th>
        			<th scope="col">Ngày Sinh</th>
        			<th scope="col">Giới Tính</th>
        			<th scope="col">Email</th>
        			<th scope="col">Mã Khoa</th>
        			<th scope="col"></th>
        		</tr>
        	</thead>
        	<tbody>
        		<%
        			List<GV> gv = GVDB.getAllGVByMaKhoa(makhoa);
        			for ( GV gv1 : gv){
        		%>
        		<tr>
        			<td><%= gv1.getMaGV() %></td>
        			<td><%= gv1.getTenGV() %></td>
        			<td><%= gv1.getNgaySinh() %></td>
        			<td><%= gv1.getGioiTinh() %></td>
        			<td><%= gv1.getEmail() %></td>
        			<td><%= gv1.getMaKhoa() %></td>
        			<td>
        				<form action="ThempcgvServlet">
        					<input type="hidden" name="mahd" value="<%= mahd %>">
        					<input type="hidden" name="magv" value="<%= gv1.getMaGV() %>">
        					<input type="hidden" name="makhoa" value="<%= makhoa %>">
							<input class="btn btn-outline-info" type="submit" value="Chọn giảng viên">
        				</form>
        			</td>
        		</tr>
        		<%} %>
        	</tbody>
        </table>
        
        <form action="XemHD.jsp">
        	<input type="hidden" name="mahd" value="<%= mahd%>">
        	<input type="hidden" name="makhoa" value="<%= makhoa %>">
        	<input type="submit" class="btn btn-outline-info" value="Lưu giảng viên">
        </form>
	</div>
</body>
</html>