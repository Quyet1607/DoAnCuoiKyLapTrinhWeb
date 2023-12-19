<%@page import="com.model.HD"%>
<%@page import="java.util.List"%>
<%@page import="com.model.HDDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hội Đồng</title>
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
	%>
    <div class="header">
		<h1><center>Quản lý sinh viên báo cáo mỗi kỳ</center></h1>
	</div>
	<div>
		<h3 class="sv"><center>Hội Đồng</center></h3>
		<table>
			<tr>
				<td>
					<form action="ThemHD.jsp">
						<input type="hidden" name="makhoa" value="<%=makhoa%>">
						<input type="submit" class=" btn btn-success" value="Thêm hội đồng mới" style="margin-left: 40px;">
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
        			<th scope="col">Mã Hội Đồng</th>
        			<th scope="col">Địa Điểm</th>
        			<th scope="col">Thời Gian</th>
        			<th scope="col">Số Sinh Viên</th>
        			<th scope="col">Số Giảng Viên</th>
        			<th scope="col">Mã Khoa</th>
        			<th scope="col" colspan="2" style="text-align: center;"> Chức năng</th>
        		</tr>
        	</thead>
        	<tbody>
        		<%
        			List<HD> hd = HDDB.getAllHDByMaKhoa(makhoa);
        			for ( HD hd1 : hd){
        		%>
        		<tr>
        			<td>HD0<%= Integer.toString(hd1.getMaHD()) %></td>
        			<td><%= hd1.getDiaDiem() %></td>
        			<td><%= hd1.getThoiGian() %></td>
        			<td><%= hd1.getSoSV() %></td>
        			<td><%= hd1.getSoGV() %></td>
        			<td><%= hd1.getMaKhoa() %></td>
        			<td>
        				<form action="CTHD.jsp">
        					<input type="hidden" value="<%= hd1.getMaHD() %>" name="mahd">
        					<input type="hidden" value="<%= hd1.getDiaDiem() %>" name="diadiem">
        					<input type="hidden" value="<%= hd1.getThoiGian() %>" name="thoigian">
        					<input type="hidden" value="<%= hd1.getMaKhoa() %>" name="makhoa">
							<input class="btn btn-outline-info" type="submit" value="Xem hội đồng">
        				</form>
        			</td>
        			<td>
        				<form action="XoaHDServlet">
        					<input type="hidden" value="<%= hd1.getMaHD() %>" name="mahd">
        					<input type="hidden" name="makhoa" value="<%= hd1.getMaKhoa() %>">
							<input class="btn btn-outline-info" type="submit" value="Xóa hội đồng">
        				</form>
        			</td>
        		</tr>
        		<%} %>
        	</tbody>
        </table>
</body>
</html>