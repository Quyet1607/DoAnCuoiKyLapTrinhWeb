<%@page import="com.model.adminDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Lý Sinh Viên Báo Cáo Mỗi Kỳ</title>
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
    <style type="text/css">
    header {
	  width: 100%;
            background-color: blue;
            height: 100px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            text-align: center;   
}

.bg1 {
	width: 100%;
	height: 300px;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color:AliceBlue
}

.container {
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-top: 200px;
}

.container div {
	text-align: center;
}

.container img {
	width: 200px;
	/* Set a fixed width for the images */
	height: auto;
	/* Maintain the aspect ratio of the images */
	margin-bottom: 10px;
	/* Add some bottom margin for spacing */
}

.nut {
	text-align: center;
	text-decoration: none;
	color: black;
	cursor: pointer;
	border: 1px solid black;
	background-color: skyblue;
	font-size: 30px;
}
.btn-outline-info{
 font-size: 25px;
}
    </style>
</head>
<body>
	<%
		String makhoa = request.getParameter("makhoa");
	%>
    <header>
        <h1 style="margin-top: 5px; margin-left: 350px;">
            Trang Quản Lý Sinh Viên Báo Cáo Mỗi Kỳ
        </h1>
         <form action="Login.jsp">
            <input class="btn btn-outline-info" type="submit" value="Đăng Xuất" style="color: white; border-color: white;">
         </form>
    </header>

    <div class="container">
        <div>
            <img src="../images/SV1.png">
            <form action="SV.jsp">
            	<input type="hidden" name="makhoa" value="<%= makhoa%>">
            	<input class="btn btn-outline-info" type="submit" value="Sinh Viên">
            </form>
        </div>
        
        <div>
            <img src="../images/GV1.png">
            <form action="GV.jsp">
            <input type="hidden" name="makhoa" value="<%= makhoa%>">
            	<input class="btn btn-outline-info"type="submit" value="Giảng Viên">
            </form>
        </div>
        
        <div>
            <img src="../images/HD1.png">
            <form action="HD.jsp">
            <input type="hidden" name="makhoa" value="<%= makhoa%>">
            	<input class="btn btn-outline-info" type="submit" value="Hội Đồng">
            </form>
        </div>
    </div>
</body>
</html>