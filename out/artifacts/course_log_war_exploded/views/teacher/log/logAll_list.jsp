<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/23
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>全部点名</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<form class="layui-form" id="form1" action="" lay-filter="dataFrm">
    <blockquote class="layui-elem-quote mylog-info-tit">
        <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="doSubmit">&#xe609;
            提交点名
        </button>
        <button type="button" class="layui-btn layui-icon" lay-submit lay-filter="return">&#xe669; 返回</button>
    </blockquote>
    <table class="layui-table" lay-skin="line">
        <colgroup>
            <col width="100">
            <col width="200">
            <col width="200">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>序号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>班级</th>
            <th>状态</th>
        </tr>
        </thead>
    </table>

    <div style="height:480px;width:100%;overflow:auto;background:#ffffff;">
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="100">
                <col width="200">
                <col width="200">
                <col width="200">
                <col>
            </colgroup>
            <tbody>
            <s:iterator value="stuList" var="stu" status="i">   <%--获取索引--%>
                <tr>
                    <td>${i.index+1}</td>
                    <td>${stu.stuId}</td>
                    <td>${stu.stuName}</td>
                    <td>${stu.claId}</td>
                    <td>
                        <input type="hidden" name="stuList[${i.index}].stuId" value="${stu.stuId}">
                        <input type="radio" name="stuList[${i.index}].logStatus" value="1" title="已到" checked>
                        <input type="radio" name="stuList[${i.index}].logStatus" value="2" title="请假">
                        <input type="radio" name="stuList[${i.index}].logStatus" value="3" title="迟到">
                        <input type="radio" name="stuList[${i.index}].logStatus" value="4" title="旷课">
                    </td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
</form>
<script src="/resources/layui/layui.js"></script>
<script>
    layui.use(['element', 'jquery', 'layer', 'form', 'table'], function () {
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        form.on('submit(return)', function () {
            window.location.href = "/views/teacher/log/log_list.jsp";
        });
        form.on('submit(doSubmit)', function () {
            layer.confirm("确定要提交吗？", {icon: 3, title: "提示"}, function () {
                var params = $("#form1").serialize();
                $.post("editLogAll_Log.action", params, function (data) {
                    if (data == true) {
                        layer.msg("提交成功！");
                        setTimeout(function () {
                            window.location.href = "/views/teacher/log/log_list.jsp";
                        }, 1000)
                    } else {
                        layer.msg("系统错误！", {icon: 5});
                    }
                })
            })
        });

    })
</script>
</body>
</html>
