<%--
  Created by IntelliJ IDEA.
  User: YHUSER
  Date: 2019/12/24
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>考勤记录</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<%--考勤统计记录信息列表--%>
<div class="layui-form" style="padding: 0 10px 0 10px">
    <table class="layui-hide" id="userTable" lay-filter="userTable"></table>
</div>

<script src="/resources/layui/layui.js"></script>
<script>
    layui.use(['element', 'jquery', 'layer', 'form', 'table', 'laytpl'], function () {
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laytpl = layui.laytpl;
        //渲染表格
        var tableIns = table.render({
            elem: '#userTable'     //对应的id
            , url: 'findAllListLog.action'//数据接口
            , defaultToolbar: ['', '', '']//右上边图标['filter','print', 'exports']
            // ,totalRow:true           //开启底部合计
            , page: true              //是否分页
            , limit: 100
            , limits: [10, 20, 30, 40, 50] //每页条数的选中
            , cols: [[
                {field: 'logId', title: '考勤编号', sort: true, align: 'center'}
                , {field: 'claId', title: '班级编号', align: 'center'}
                , {field: 'logCount', title: '考勤人数', width: 100, align: 'center'}
                , {field: 'logArrive', title: '已到人数', width: 100, align: 'center'}
                , {field: 'logLeave', title: '请假人数', width: 100, align: 'center'}
                , {field: 'logLate', title: '迟到人数', width: 100, align: 'center'}
                , {field: 'logAbsent', title: '缺席人数', width: 100, align: 'center'}
                , {field: 'logDate', title: '考勤时间', align: 'center'}
            ]]
        });
    });
</script>
</body>
</html>
