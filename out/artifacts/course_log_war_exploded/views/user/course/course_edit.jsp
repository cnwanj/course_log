<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/15
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>课程信息编辑</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" style="text-align: center;">
    <div class="layui-field-box " style="background:rgba(0, 0, 0, 0.1);">
        <h2>课程信息编辑</h2>
    </div>
</fieldset>
<blockquote class="layui-elem-quote mylog-info-tit">

    <form class="layui-form" id="form2" action="" lay-filter="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">课程编号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couId" value="<s:property value="course.couId"/>" readonly="readonly"
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">课程名称:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couName" value="<s:property value="course.couName"/>" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">教师姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaName" value="<s:property value="course.teaName"/>" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学年:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couYear" value="<s:property value="course.couYear"/>" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学期:</label>
                <div class="layui-input-inline">
                    <input type="text" name="couTerm" value="<s:property value="course.couTerm"/>" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="doSubmit"
                        id="doSubmit">&#x1005; 保存
                </button>
                <button type="reset" class="layui-btn layui-btn-danger layui-icon" id="ret">&#xe669; 返回</button>
            </div>
        </div>
    </form>
</blockquote>
<script src="/resources/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['layer', 'form', 'jquery'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(doSubmit)', function (data) {
            layer.confirm("确定保存吗？", {icon: 3, title: "提示"}, function (index) {
                var params = data.field;
                // var params = $("#form2").serialize();
                $.post("edit_Course.action", params, function () {
                    layer.msg("保存成功！");
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.href = "find_Course.action";
                    }, 2000);
                });
            });
        });
        $("#ret").click(function () {
            window.location.href = "find_Course.action";
        });
    })
</script>
</body>
</html>
