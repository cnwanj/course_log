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
    <title>教师信息编辑</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" style="text-align: center;">
    <div class="layui-field-box " style="background:rgba(0, 0, 0, 0.1);">
        <h2>教师信息编辑</h2>
    </div>
</fieldset>
<blockquote class="layui-elem-quote mylog-info-tit">

    <form class="layui-form" id="form2" action="" lay-filter="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">编号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaId" value="<s:property value="teacher.teaId"/>" readonly="readonly"
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaName" value="<s:property value="teacher.teaName"/>"
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaPwd" value="<s:property value="teacher.teaPwd"/>" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">所属学院:</label>
                <div class="layui-input-inline">
                    <%--                    <input type="text" name="depId" value="<s:property value="teacher.depId"/>" lay-verify="required" autocomplete="off" class="layui-input">--%>
                    <select name="depId" lay-verify="required" lay-search="">
                        <option value="<s:property value="teacher.depId"/>"><s:property value="teacher.depId"/></option>
                        <s:iterator value="depList" var="dep">
                            <option value="${dep.depId}">${dep.depName}</option>
                        </s:iterator>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号码:</label>
                <div class="layui-input-inline">
                    <input type="text" name="teaPhone" value="<s:property value="teacher.teaPhone"/>"
                           lay-verify="required|phone" autocomplete="off" class="layui-input">
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
        form.on('submit(doSubmit)', function () {
            layer.confirm("确定保存吗？", {icon: 3, title: "提示"}, function (index) {
                var params = $("#form2").serialize();
                $.post("edit_Teacher.action", params, function () {
                    layer.msg("保存成功！");
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.href = "findAll_Teacher.action";
                    }, 1000);
                });
            });
        });
        $("#ret").click(function () {
            window.location.href = "findAll_Teacher.action";
        });
    })
</script>
</body>
</html>
