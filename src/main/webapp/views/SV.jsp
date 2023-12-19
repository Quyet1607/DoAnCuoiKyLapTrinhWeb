<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.SVDB"%>
<%@page import="com.model.SV"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sinh Viên </title>
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
		height:60px;
		
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
	%>
	<div class="header">
		<h1><center>Quản lý sinh viên báo cáo mỗi kỳ</center></h1>
	</div>
	<div>
		<h3 class="sv"><center>Sinh Viên</center></h3>
		<table>
			<tr>
				<td>
					<form action="ThemSV.jsp">
						<input type="hidden" name="makhoa" value="<%=makhoa%>">
						<input type="submit" class=" btn btn-success" value="Thêm sinh viên mới" style="margin-left: 40px;">
					</form>
				</td>
				<td>
					<form action="homepage.jsp">
						<input type="hidden" name="makhoa" value="<%=makhoa%>">
						<input type="submit" class=" btn btn-success" value="Về trang chủ">
					</form>
				</td>
			</tr>
		</table>
		
	</div>
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
        				<form action="SuaSV.jsp">
        					<input type="hidden" name="masv" value="<%= sv1.getMaSV() %>">
        					<input type="hidden" name="tensv" value="<%= sv1.getTenSV() %>">
        					<input type="hidden" name="ns" value="<%= sv1.getNgaySinh() %>">
        					<input type="hidden" name="gt" value="<%= sv1.getGioiTinh() %>">
        					<input type="hidden" name="quequan" value="<%= sv1.getQueQuan() %>">
        					<input type="hidden" name="makhoa" value="<%= sv1.getMaKhoa() %>">
        					<input type="hidden" name="malop" value="<%= sv1.getMaLop() %>">
        					<input type="hidden" name="khoahoc" value="<%= sv1.getKhoaHoc() %>">
							<input class="btn btn-outline-info" type="submit" value="Sửa">
        				</form>
        			</td>
        			<td>
        				<form action="XoaSVServlet">
        					<input type="hidden" name="masv" value="<%= sv1.getMaSV() %>">
        					<input type="hidden" name="makhoa" value="<%= sv1.getMaKhoa() %>">
							<input class="btn btn-outline-info" type="submit" value="Xóa">
        				</form>
        			</td>
        		</tr>
        		<%} %>
        	</tbody>
        </table>
</body>
</html>