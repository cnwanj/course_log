<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/23
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>随机点名</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <style>
        .rd {
            width: 22px;
            height: 22px;
            font-size: 20px;
            vertical-align: -6px;
            margin: 10px 10px 10px;
        }

        .rdo {
            width: 22px;
            height: 22px;
            font-size: 20px;
            vertical-align: -6px;
            margin: 10px 10px 10px 50px;
        }
    </style>
</head>
<body>
<form id="form1">
    <blockquote class="layui-elem-quote mylog-info-tit">
        <button type="button" class="layui-btn layui-btn-danger layui-icon" lay-submit lay-filter="logRandom">&#xe615;
            点击抽取
        </button>
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

    <div style="height:470px;width:100%;overflow:auto;background:#F2F2F2;">
        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col width="100">
                <col width="200">
                <col width="200">
                <col width="200">
                <col>
            </colgroup>
            <tbody id="tbd">
            </tbody>
        </table>
    </div>
</form>
<script src="/resources/layui/layui.js"></script>
<script>
    var i = 0;
    layui.use(['element', 'jquery', 'layer', 'form', 'table'], function () {
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        form.on('submit(logRandom)', function () {
            $.post("randomDrawLog.action", function (data) {
                if (data != null && data != "") {
                    var tbd = document.getElementById("tbd");
                    var tr = document.createElement("tr");
                    var td0 = document.createElement("td");
                    var td1 = document.createElement("td");
                    var td2 = document.createElement("td");
                    var td3 = document.createElement("td");
                    var td4 = document.createElement("td");
                    td0.innerText = i + 1;
                    td1.innerText = data.stuId;
                    td2.innerText = data.stuName;
                    td3.innerText = data.claId;
                    td4.innerHTML = "<input type='hidden' name='stuList[" + i + "].stuId' value='" + data.stuId + "'>" +
                        "<input type='radio' name='stuList[" + i + "].logStatus' value='1' checked class='rd'/>已到" +
                        "<input type='radio' name='stuList[" + i + "].logStatus' value='2' class='rdo'/>请假" +
                        "<input type='radio' name='stuList[" + i + "].logStatus' value='3' class='rdo'/>迟到" +
                        "<input type='radio' name='stuList[" + i + "].logStatus' value='4' class='rdo'/>旷课";
                    tr.appendChild(td0);
                    tr.appendChild(td1);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    tbd.appendChild(tr);
                    form.render(tbd);
                    i++;
                } else {
                    layer.msg("没有学生啦！", {icon: 5});
                }
            });
        });

        //提交点名
        form.on('submit(doSubmit)', function () {
            layer.confirm("确定要提交吗？", {icon: 3, title: "提示"}, function () {
                var params = $("#form1").serialize();
                if (params != null && params != "") {
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
                } else {
                    layer.msg("你还没有抽取学生！", {icon: 5});
                }
            })
        });
        form.on('submit(return)', function () {
            window.location.href = "/views/teacher/log/log_list.jsp";
        });
    })
</script>
</body>
</html>
