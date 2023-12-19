<%@page import="com.model.SVDB"%>
<%@page import="com.model.pcsv"%>
<%@page import="com.model.pcsvDB"%>
<%@page import="com.model.pcgvDB"%>
<%@page import="com.model.GVDB"%>
<%@page import="com.model.pcgv"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.model.HDDB"%>
<%@page import="com.model.HD"%>
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

	.name{
		vertical-align: top;
		font-size: 35px;
	}
	.ten1{
		font-size: 35px;
	}
	.container{
		width: 70%;
		position: absolute;
		left: 25%;
		top: 8%;
	}
	.btn-outline-info{
		position: relative;
		left: 59%;
		font-size: 25px;
}
table {
  border-collapse: collapse;
  width: 70%;
  margin-bottom: 10px;
}

td {
  border: 1px solid #ddd;
}

tr {
  margin-bottom: 10px;
}

th, td {
  padding: 15px;
  text-align: left;
}
</style>
</head>
<body>
	<%
		String makhoa = request.getParameter("makhoa");
		int mahd = Integer.parseInt(request.getParameter("mahd"));
		HD hd = HDDB.getHDByMaHD(mahd);
	%>
	<div class="header">
		<h1><center>Quản lý sinh viên báo cáo mỗi kỳ</center></h1>
	</div>
	<div class="container">
	<table>
	
	<tr class="ten1">
		<td colspan="2" style="text-align: center;" class="name">
			<b>HD0<%= mahd %></b>
		</td>
	</tr>
	
	<tr>
		<td class="ten1">
			<b>Địa điểm:</b>
		</td>
		<td class="name"> <%= hd.getDiaDiem() %> </td>
	</tr>
	
	<tr>
		<td class="ten1">
			<b>Thời gian:</b>
		</td>
		<td class="name"> <%= hd.getThoiGian() %> </td>
	</tr>
	<tr class="name">
		<td class="ten1"><b>Giảng viên:</b></td>
		<td>
			<%
				List<pcgv> pc1 = pcgvDB.getAllMaGVByMaHD(mahd);
				for(pcgv pc : pc1){
					String magv = pc.getMaGV();
					String tengv = GVDB.getTenGVByMaGV(magv);
			%>
			<div class="name"> <%= tengv %></div>
			<%}%>
		</td>
	</tr>
	
	<tr class="name">
		<td class="ten1"><b>Sinh viên:</b></td>
		<td>
			<%
				List<pcsv> pcsv1 = pcsvDB.getAllMaSVByMaHD(mahd);
				for(pcsv pc : pcsv1){
					String masv = pc.getMaSV();
					String tensv = SVDB.getTenSVByMaSV(masv);
			%>
			<div class="name"><%= tensv %></div>
			<%}%>
		</td>
	</tr>
		</table>
	<form action="HD.jsp">
		<input type="hidden" name="makhoa" value="<%= makhoa%>">
		<input type="submit" value="Xong" class="btn btn-outline-info">
	</form>
	</div>
</body>
</html>