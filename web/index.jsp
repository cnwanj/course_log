<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/15
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>课程考勤系统</title>
    <link rel="shortcut icon" href="resources/images/logo.jpg">
    <link rel="stylesheet" href="resources/layui/css/layui.css">
</head>
<body class="layui-layout-body">

<c:choose>
    <c:when test="${tea.teaTags==1 || tea.teaTags==0}">

        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <div class="layui-logo" style="font-size: 25px">课堂考勤系统</div>
                <!-- 头部区域（可配合layui已有的水平导航） -->

                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        </a>
                    </li>
                    <li class="layui-nav-item layui-icon"><a>&#xe612; ${tea.teaName} 欢迎您</a></li>
                    <li class="layui-nav-item ">
                        <button type="button" class="layui-btn layui-btn-danger layui-icon" lay-submit lay-filter="out">
                            &#xe669; 退出
                        </button>
                    </li>
                </ul>
            </div>

            <div class="layui-side layui-bg-black">
                <div class="layui-side-scroll">
                    <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                    <ul class="layui-nav layui-nav-tree" lay-filter="test">
                        <c:choose>
                            <c:when test="${tea.teaTags == 0}">
                                <li class="layui-nav-item layui-nav-itemed">
                                    <a class="layui-icon layui-icon-user" href="javascript:;"> 管理员信息管理</a>
                                    <dl class="layui-nav-child">
                                        <dd><a href="getOne_User.action" target="right" class="layui-icon">&#xe716;
                                            设置个人信息</a></dd>
                                        <dd><a href="findAll_Department.action" target="right" class="layui-icon">&#xe705;
                                            二级学院信息管理</a></dd>
                                        <dd><a href="findAll_Teacher.action" target="right" class="layui-icon">&#xe63c;
                                            教师信息管理</a></dd>
                                        <dd><a href="find_Course.action" target="right" class="layui-icon">&#xe656;
                                            课程信息管理</a></dd>
                                        <dd><a href="findAll_Classes.action" target="right" class="layui-icon">&#xe613;
                                            班级信息管理</a></dd>
                                        <dd><a href="views/user/student/student_list.jsp" target="right"
                                               class="layui-icon">&#xe66f; 学生信息管理</a></dd>
                                    </dl>
                                </li>
                            </c:when>
                            <c:when test="${tea.teaTags == 1}">
                                <li class="layui-nav-item layui-nav-itemed">
                                    <a class="layui-icon layui-icon-user" href="javascript:;"> 教师信息管理</a>
                                    <dl class="layui-nav-child">
                                        <dd><a href="views/teacher/log/log_list.jsp" target="right" class="layui-icon">&#xe6b2;
                                            考勤信息管理</a></dd>
                                    </dl>
                                </li>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>
            </div>

            <div class="layui-body">
                <!-- 内容主体区域 -->
                <iframe scrolling="auto" rameborder="0" src="views/others/main.jsp" name="right" width="100%"
                        height="99%"></iframe>
            </div>

            <div class="layui-footer" style="text-align: center;">
                <!-- 底部固定区域 -->
                17软件工程2班韦永恒
            </div>
        </div>
        <script src="resources/layui/layui.js"></script>

        <script>
            layui.use(['element', 'layer', 'form', 'jquery'], function () {
                var element = layui.element;
                var layer = layui.layer;
                var form = layui.form;
                var $ = layui.jquery;
                form.on('submit(out)', function () {
                    layer.confirm("确定要退出吗？", {icon: 3, title: "提示"}, function (index) {
                        // var params = $("#form2").serialize();
                        $.post("out_Login.action", function () {
                            layer.msg("退出成功！");
                            setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                                window.location.href = "login.jsp";
                            }, 1000);
                        });
                    });
                });
            })
        </script>
    </c:when>
    <c:otherwise>
        <%--      <div style="padding: 20px 20px">--%>
        <%--        <h1>404错误！你还没登录！</h1>--%>
        <%--      </div>--%>
        <img src="resources/images/error_404.jpg"/>
    </c:otherwise>
</c:choose>
</body>
</html>
