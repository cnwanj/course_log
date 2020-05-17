<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/21
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>课堂考勤系统</title>
    <link rel="shortcut icon" href="resources/images/logo.jpg">
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <link rel="stylesheet" href="resources/css/style2.css">
    <script src='resources/js/jquery.min.js'></script>
    <script src="resources/js/bg.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('resources/images/4.jpg');
            background-size: 100% 100%;
        }
    </style>
    <script>
        $(function () {
            $("#btn").click(function () {
                var params = $("#login").serialize();
                $.post("loginAction", params, function (data) {
                    // alert(data.teaId);
                    if (data == null) {
                        var html = "密码错误或用户名不存在!";
                        p.innerHTML = html;
                    } else {
                        window.location.href = "index.jsp";
                    }
                })
            })
        })
    </script>
</head>
<body onload="bcg()">
<div class="signup-form">
    <img src="resources/images/logo.jpg">
    <form id="login">
        <h1>课堂考勤系统</h1>
        <p id="p" style="font-size: 17px; color: red;font-weight: bold">&nbsp;</p>
        <input type="text" name="id" placeholder="用户名" class="txtb">
        <input type="password" name="pwd" placeholder="密码" class="txtb">
        <input type="button" id="btn" value="用户登录" class="signup-btn">
    </form>
</div>
</body>
</html>
