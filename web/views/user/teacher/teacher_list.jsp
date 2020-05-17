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
    <title>教师信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" style="text-align: center;">
    <div class="layui-field-box " style="background:rgba(0, 0, 0, 0.1);">
        <h2>教师信息管理</h2>
    </div>
</fieldset>
<%--添加弹出层表单--%>
<div style="display: none; padding-top: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" id="form2" action="" lay-filter="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">编号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaId" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">所属学院:</label>
                <div class="layui-input-inline">
                    <select name="depId" lay-verify="required" lay-search="" name="depId">
                        <option value="">请选择学院</option>
                        <s:iterator value="depList" var="dep">
                            <option value="${dep.depId}">${dep.depName}</option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaPwd" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">手机号码:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaPhone" lay-verify="required|phone" autocomplete="off"
                           class="layui-input">
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
                <input type="text" name="teaName" id="iname" list="nameList" lay-verify="required" autocomplete="off"
                       placeholder="请输入" class="layui-input">
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
                <th>教师编号</th>
                <th>教师姓名</th>
                <th>所属学院</th>
                <th>联系电话</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="pages.list" var="tea">
                <tr>
                    <td>${tea.teaId}</td>
                    <td>${tea.teaName}</td>
                    <td>${tea.depId}</td>
                    <td>${tea.teaPhone}</td>
                    <th>
                        <button type="button" class="layui-btn layui-icon" name="${tea.teaId}" onclick="edit(this)">
                            &#xe642; 编辑
                        </button>
                        <button type="button" class="layui-btn layui-btn-danger layui-icon" lay-submit
                                lay-filter="delete" name="${tea.teaId}" onclick="del(this)">&#xe640; 删除
                        </button>
                    </th>
                </tr>
            </s:iterator>
            </tbody>
        </table>
    </div>
    <div style="padding-left: 400px;">
        <a href="findAll_Teacher.action" class="layui-btn layui-btn-sm layui-btn-primary">首页</a>
        <a href="findAll_Teacher.action?pageCount=${pages.pageCount-1}"
           class="layui-btn layui-btn-sm layui-btn-primary">上一页</a>
        <a class="layui-btn layui-btn-sm">${pages.pageCount}</a>
        <a href="findAll_Teacher.action?pageCount=${(pages.pageCount+1)>=pages.totalPage?pages.totalPage:(pages.pageCount+1)}"
           class="layui-btn layui-btn-sm layui-btn-primary">下一页</a>
        <a href="findAll_Teacher.action?pageCount=${pages.totalPage}" class="layui-btn layui-btn-sm layui-btn-primary">尾页</a>
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
                title: "添加用户",
                content: $("#saveOrUpdateDiv"),
                area: ['500px'],
                anim: 4,     //设置弹出动画
                btnAlign: 'c', //按钮对齐方式
                success: function (index) {
                    url = "save_Teacher.action";
                }
            })
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
                        window.location.href = "findAll_Teacher.action";
                    }, 2000);
                } else {
                    layer.msg("该用户已存在！", {icon: 5});
                }
            });
        });
        //监听搜索输入框
        $("#iname").keyup(function () {
            $("#nameList option").remove(); //将列表清空
            var param = {teaName: ($("#iname").val() == "" ? 0 : $("#iname").val())};
            $.post("searchTeacher.action", param, function (data) {
                var list = "";
                for (var i in data) {
                    list += "<option value='" + data[i].teaName + "'></option>'"
                }
                $("#nameList").html(list);
            });
        });
        //监听搜索按钮
        form.on('submit(search)', function () {
            var n = $("#form1").serialize();
            $.post("searchTeacher.action", n, function (data) {
                if (data[0] != null) {
                    var html = "<table class=\"layui-table\" lay-even  lay-size=\"lg\" lay-filter=\"demo\">\n" +
                        "    <thead>\n" +
                        "    <tr>\n" +
                        "        <th>教师编号</th>\n" +
                        "        <th>教师姓名</th>\n" +
                        "        <th>所属学院</th>\n" +
                        "        <th>联系电话</th>\n" +
                        "        <th>操作</th>\n" +
                        "    </tr>\n" +
                        "    </thead>\n" +
                        "    <tbody>";
                    for (var i = 0; i < data.length; i++) {
                        html += "<tr>" +
                            "<td>" + data[i].teaId + "</td>" +
                            "<td>" + data[i].teaName + "</td>" +
                            "<td>" + data[i].depId + "</td>" +
                            "<td>" + data[i].teaPhone + "</td>" +
                            "<th>" +
                            "<button type='button' class='layui-btn layui-icon' name='" + data[i].teaId + "' onclick='edit(this)'>" + "&#xe642; 编辑" + "</button>" +
                            "<button type='button' class='layui-btn layui-btn-danger layui-icon' lay-submit lay-filter='delete' name='" + data[i].teaId + "' onclick='del(this)'>" + "&#xe640; 删除" + "</button>" +
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
        window.location.href = "getOne_Teacher.action?teaId=" + event.name;
    }

    function del(event) {
        var target = window.confirm("你真的要删除吗？");
        if (target) {
            window.location.href = "delete_Teacher.action?teaId=" + event.name + "&pageCount=" +${pages.totalCount==6?(pages.pageCount-1):pages.pageCount};
        }
    }
</script>
</body>
</html>
