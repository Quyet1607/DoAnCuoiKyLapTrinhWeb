<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Admin</title>
<style type="text/css">
	html, body{
    width: 100%;
    background-color:lightCyan;
}
.box{
    text-align: center;
    background: lightCyan;
    width: 400px;
    height: auto;
    padding: 25px;
    position: absolute;
    left: 50%; top:50%;
    transform: translate(-50%,-50%);
    box-shadow: 0px 0px 20px 0px lightcyan;
}
.box h1{
    color: black;
}
.box input[type="password"], .box input[type="email"]{
    background: none;
    outline: none;
    width: 210px;
    height: 40px;
    border-radius: 40px;
    padding: 0px 15px;
    margin: 15px 0px;
    border: solid 2px silver;
    transition: 1s;
}
.box input[type="password"]:focus, .box input[type="email"]:focus{
    width: 320px;
    border-color: skyblue;
    transition: 1s;
}
.box input[type="submit"]{
    background: none;
    outline: none;
    width: 160px;
    height: 40px;
    border-radius: 40px;
    margin: 15px 0px;
    border: solid 2px silver;
    color: black;
    font-size: 18px;
    transition: 1s;
    cursor: pointer;
}
.box input[type="submit"]:hover{
    background: silver;
    transition: 1s;
}
</style>
</head>	
<body>
	<form action="loginServlet" method="get" class="box">
        <font face="Times New Roman" size="5"><h3>Login Admin</h3></font>
        <input type="email" placeholder="Email" name="email">
        <input type="password" placeholder="Password"  name="pass">
        <input type="submit" value="Login">
 	</form>
</body>
</html>