<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/15
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>课程信息管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" style="text-align: center;">
    <div class="layui-field-box " style="background:rgba(0, 0, 0, 0.1);">
        <h2>课程信息管理</h2>
    </div>
</fieldset>
<%--添加弹出层表单--%>
<div style="display: none; padding-top: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" id="form2" action="" lay-filter="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">课程编号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couId" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">课程名称:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">老师姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">学年:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couYear" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">学期:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couTerm" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="doSubmit"
                        id="doSubmit">&#x1005; 保存
                </button>
                <button type="reset" class="layui-btn layui-icon layui-btn-primary">&#xe669; 重置</button>
            </div>
        </div>
    </form>
</div>
<blockquote class="layui-elem-quote mylog-info-tit">
    <div class="layui-inline">
        <form class="layui-form" id="form1" lay-filter="dataFrm">
            <div class="layui-input-inline" style="width:200px;">
                <input type="text" id="iname" list="nameList" lay-verify="required" autocomplete="off" placeholder="请输入"
                       class="layui-input">
                <datalist id="nameList">
                </datalist>
            </div>
            <button type="button" class="layui-btn layui-icon" lay-submit lay-filter="search" id="search">&#xe615; 搜索
            </button>
        </form>
    </div>
    <div class="layui-inline">
        &nbsp;<button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="save"
                      id="save">&#xe608; 添加
    </button>
    </div>
</blockquote>
<div id="divTable">
    <div id="tabList">
        <table class="layui-table" lay-even lay-size="lg" lay-filter="demo">
            <thead>
            <tr>
                <th>课程编号</th>
                <th>课程名称</th>
                <th>教师姓名</th>
                <th>学年</th>
                <th>学期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="pages.list" var="cou">
                <tr>
                    <td>${cou.couId} </td>
                    <td>${cou.couName}</td>
                    <td>${cou.teaName}</td>
                    <td>${cou.couYear}</td>
                    <td>${cou.couTerm}</td>
                    <th>
                        <button type="button" class="layui-btn layui-icon" name="${cou.couId}" onclick="edit(this)">
                            &#xe642; 编辑
                        </button>
                        <button type="button" class="layui-btn layui-btn-danger layui-icon" lay-submit
                                lay-filter="delete" name="${cou.couId}" onclick="del(this)">&#xe640; 删除
                        </button>
                    </th>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
    <div style="padding-left: 400px;">
        <a href="find_Course.action" class="layui-btn layui-btn-sm layui-btn-primary">首页</a>
        <a href="find_Course.action?pageCount=${pages.pageCount-1}"
           class="layui-btn layui-btn-sm layui-btn-primary">上一页</a>
        <a class="layui-btn layui-btn-sm">${pages.pageCount}</a>
        <a href="find_Course.action?pageCount=${(pages.pageCount+1)>=pages.totalPage?pages.totalPage:(pages.pageCount+1)}"
           class="layui-btn layui-btn-sm layui-btn-primary">下一页</a>
        <a href="find_Course.action?pageCount=${pages.totalPage}"
           class="layui-btn layui-btn-sm layui-btn-primary">尾页</a>
        <a class="layui-btn layui-btn-sm layui-btn-primary">共${pages.totalPage}页</a>
    </div>
</div>
<script src="/resources/layui/layui.js" charset="utf-8"></script>
<script>

    layui.use(['element', 'jquery', 'layer', 'form', 'table'], function () {
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var url;
        var mainIndex;
        //打开添加层
        form.on('submit(save)', function (data) {
            mainIndex = layer.open({
                type: 1,
                title: "添加课程信息",
                content: $("#saveOrUpdateDiv"),
                area: ['500px'],
                anim: 4,     //设置弹出动画
                btnAlign: 'c', //按钮对齐方式
                success: function (index) {
                    url = "save_Course.action";
                }
            });
        });

        //提交表单数据
        form.on('submit(doSubmit)', function (data) {
            var params = $("#form2").serialize();
            $.post(url, params, function (obj) {
                if (obj == true) {
                    layer.msg("添加成功！");
                    $("#form2")[0].reset();      //清空表单数据
                    layer.close(mainIndex);      //关闭保存弹出层
                    setTimeout(function () {
                        window.location.href = "find_Course.action";
                    }, 1000);
                } else {
                    layer.msg("该课程信息已存在！", {icon: 5});
                }
            });
        });
        //监听搜索输入框
        $("#iname").keyup(function () {
            $("#nameList option").remove(); //将列表清空
            var param = {couName: ($("#iname").val() == "" ? 0 : $("#iname").val())};
            $.post("searchCourse.action", param, function (data) {
                var list = "";
                for (var i in data) {
                    list += "<option value='" + data[i].couName + "'></option>'"
                }
                $("#nameList").html(list);
            });
        });
        //监听搜索按钮
        form.on('submit(search)', function () {
            var n = $("#form1").serialize();
            $.post("searchCourse.action", n, function (data) {
                if (data[0] != null) {
                    var html = "<table class=\"layui-table\" lay-even  lay-size=\"lg\" lay-filter=\"demo\">\n" +
                        "    <thead>\n" +
                        "    <tr>\n" +
                        "        <th>课程编号</th>\n" +
                        "        <th>课程名称</th>\n" +
                        "        <th>教师姓名</th>\n" +
                        "        <th>学年</th>\n" +
                        "        <th>学期</th>\n" +
                        "        <th>操作</th>\n" +
                        "    </tr>\n" +
                        "    </thead>\n" +
                        "    <tbody>";
                    for (var i = 0; i < data.length; i++) {
                        html += "<tr>" +
                            "<td>" + data[i].couId + "</td>" +
                            "<td>" + data[i].couName + "</td>" +
                            "<td>" + data[i].teaName + "</td>" +
                            "<td>" + data[i].couYear + "</td>" +
                            "<td>" + data[i].couTerm + "</td>" +
                            "<th>" +
                            "<button type='button' class='layui-btn layui-icon' name='" + data[i].couId + "' onclick='edit(this)'>" + "&#xe642; 编辑" + "</button>" +
                            "<button type='button' class='layui-btn layui-btn-danger layui-icon' lay-submit lay-filter='delete' name='" + data[i].couId + "' onclick='del(this)'>" + "&#xe640; 删除" + "</button>" +
                            "</th>" +
                            "</tr>";
                    }
                    html += "</tbody>\n" +
                        "</table>";
                    $("#divTable").empty().html(html);
                } else {
                    layer.msg("该信息不存在！", {icon: 5});
                }
            });
        });
    });

    function edit(event) {
        window.location.href = "getOne_Course.action?couId=" + event.name;
    }

    function del(event) {
        var target = window.confirm("你真的要删除吗？");
        if (target) {
            window.location.href = "delete_Course.action?couId=" + event.name + "&pageCount=" +${pages.totalCount==6?(pages.pageCount-1):pages.pageCount};
        }
    }
</script>
</body>
</html>
