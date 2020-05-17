<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/21
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>

<div style="display:none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger layui-icon" lay-event="deleteMany">&#xe640;
        批量删除
    </button>
    <div class="layui-inline">
        <input class="layui-input layui-icon" id="iname" list="nameList" placeholder="请输入姓名" lay-event="searchInput"
               autocomplete="off">
        <datalist id="nameList"></datalist>
    </div>
    <button class="layui-btn layui-btn-sm layui-icon" data-type="reload" lay-event="search">&#xe615; 搜索</button>

    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal layui-icon" lay-submit lay-filter="add"
            id="add" lay-event="add">&#xe61f; 增加
    </button>
    <%--    <button type="button" class="layui-btn layui-btn-sm" lay-event="getSelect">获取选中行</button>--%>
    <button type="button" class="layui-btn layui-btn-sm layui-icon" lay-event="reloadTable">&#xe666; 刷新</button>
</div>
<%--添加弹出层表单--%>
<div style="display:none; padding-top: 20px; " id="openAdd">
    <form class="layui-form" id="form1" action="" lay-filter="dataSave">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuId" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-block">
                    <input type="radio" name="stuSex" value="1" title="男" checked="">
                    <input type="radio" name="stuSex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuAddress" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuPhone" lay-verify="required|phone" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">班级:</label>
                <div class="layui-input-inline">
                    <select name="claId" lay-verify="required" lay-search="" id="addSele">
                        <%--                            <option value="">请选择班级</option>--%>
                    </select>
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
<%--编辑弹出层表单--%>
<div style="display:none; padding-top: 20px; " id="openEdit">
    <form class="layui-form" id="form2" action="" lay-filter="dataEdit">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuId" lay-verify="required" value="" readonly autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-block">
                    <input type="radio" name="stuSex" value="1" title="男" checked="">
                    <input type="radio" name="stuSex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuAddress" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuPhone" lay-verify="required|phone" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">班级:</label>
                <div class="layui-input-inline">
                    <select name="claId" lay-verify="required" lay-search="" id="editSele">
                        <option></option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="doEdit"
                        id="doEdit">&#x1005; 保存
                </button>
                <button type="button" class="layui-btn layui-icon layui-btn-primary" lay-filter="doClose" id="doClose">
                    &#x1006; 关闭
                </button>
            </div>
        </div>
    </form>
</div>
<div id="userBar" style="display:none;">
    <a class="layui-btn layui-btn-sm layui-icon" lay-event="edit">&#xe642; 编辑</a>
    <a class="layui-btn layui-btn-sm layui-btn-danger layui-icon" lay-event="del">&#xe640; 删除</a>
</div>
<%--<div id="userBar" style="display:none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>--%>
<script src="/resources/layui/layui.js"></script>
<script>
    layui.use(['element', 'jquery', 'layer', 'form', 'table'], function () {
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;

        //渲染表格
        var tableIns = table.render({
            elem: '#userTable'     //对应的id
            , url: 'findStudent.action'//数据接口
            // ,url: '/resources/json/teacher.json'//数据接口
            , title: '用户数据表'    //数据文件导出来的标题
            // ,toolbar:""
            , toolbar: "#userToolBar"     //表头的工具条
            , defaultToolbar: []//右上边图标['filter','print', 'exports']
            // ,height:'full-200'       //列表默认宽度
            , done: function (res, curr, count) {
                // alert(res);          //后台返回的json格式
                // alert(curr);         //当前页
                // alert(count);        //总数据数
            }
            // ,totalRow:true           //开启底部合计
            , limits: [5, 10, 15, 20, 25]     //每页条数的选中
            , page: true                 //是否分页
            , cols: [[
                {type: 'checkbox', fixed: 'left', align: 'center', align: 'center'}//复选框
                , {field: 'stuId', title: '学号', sort: true, align: 'center'}
                , {field: 'stuName', title: '姓名', align: 'center'}
                , {
                    field: 'stuSex', title: '性别', align: 'center', templet: function (d) {
                        return d.stuSex == 0 ? '女' : '男';
                    }
                }
                , {field: 'stuAddress', title: '地址', align: 'center'}
                , {field: 'stuPhone', title: '电话号码', align: 'center'}
                , {field: 'claId', title: '班级编号', sort: true, align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#userBar', width: 200, align: 'center'}
            ]]
        });
        //监听上部工具栏事件
        table.on('toolbar(userTable)', function (obj) {
            switch (obj.event) {
                case 'add':
                    openAdd();
                    break;
                case 'deleteMany':
                    openDeleteMany();
                    break;
                case 'searchInput':
                    searchInput();
                    break;
                case 'search':
                    search();
                    break;
                // case 'getSelect':
                //     var checkStatus = table.checkStatus('userTable'); //idTest 即为基础参数 id 对应的值
                //     console.log(checkStatus.data); //获取选中行的数据
                //     console.log(checkStatus.data.length); //获取选中行数量，可作为是否有选中行的条件
                //     console.log(checkStatus.isAll ); //表格是否全选
                //     break;
                case 'reloadTable':
                    tableIns.reload();      //括号中可以放{resources/json/teacher.json}json的请求地址
                    break;
            }
        });

        //批量删除
        function openDeleteMany() {
            var list = table.checkStatus('userTable').data;   //userTable为表格对应的id值
            if (list.length > 0) {
                layer.confirm('真的删除行么？', {icon: 3, title: "提示"}, function (index) {
                    var sum = new Array();
                    for (var i in list) {
                        sum[i] = list[i].stuId;
                    }
                    $.post("deleteMany_Student.action", {"sum": sum.toString()}, function () {
                        layer.msg("删除成功！");
                        tableIns.reload();      //刷新表格
                    })
                })
            } else {
                layer.msg("请选择要删除的数据！", {icon: 5});
            }
        }

        //搜索输入
        function searchInput() {
            $("#iname").keyup(function () {
                $("#nameList option").remove();     //清空dataList标签中的选项
                var param = {stuName: ($("#iname").val() == "" ? 0 : $("#iname").val())};
                $.post("searchStudent.action", param, function (data) {
                    var list = "";
                    var arr = new Array();
                    for (var i in data) {
                        arr[i] = data[i].stuName;
                    }
                    for (var i = 0; i < arr.length; i++) {    //去除重复元素
                        if (arr[i] != arr[i + 1]) {
                            list += "<option value='" + arr[i] + "'></option>"
                        }
                    }
                    $("#nameList").html(list);
                })
            });
        }

        //搜索单击事件
        function search() {
            var iname = $("#iname").val();
            if (iname == "" || iname == null) {
                layer.msg("请输入数据！!", {icon: 5});
            } else {
                tableIns.reload({                   //重载表格
                    url: "searchBtnStudent.action",//重载的路径
                    where: {stuName: iname}       //重载需要携带的数据，可以多个
                });
            }
        }

        //打开添加弹出层
        function openAdd() {
            var mainIndex = layer.open({
                type: 1,
                title: '添加学生表单',
                content: $("#openAdd"), //这里content是一个普通的String
                area: ['500px'],
                anim: 3,     //设置弹出动画
                btnAlign: 'c', //按钮对齐方式
                success: function (index) {
                    $.post("getOneStudent.action", function (obj) {
                        var server = document.getElementById("addSele");    //server为select定义的id
                        if (server.value != null && server.value != "") {
                            server.remove();
                        }
                        for (var i in obj) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", obj[i].claId);     // 给option的value添加值
                            option.innerText = obj[i].claName;  // 打印option对应的纯文本
                            server.appendChild(option);         //给select添加option子标签
                            form.render("select");              // 刷新select，显示出数据
                        }
                    });
                }
            });
            //提交表单数据
            form.on('submit(doSubmit)', function (data) {
                var params = $("#form1").serialize();
                $.post("save_Student.action", params, function (obj) {
                    if (obj == true) {
                        layer.msg("添加成功！");
                        $("#form1")[0].reset();      //清空表单数据
                        layer.close(mainIndex);      //关闭保存弹出层
                        tableIns.reload();           //刷新表格
                    } else {
                        layer.msg("该学生信息已存在！", {icon: 5});
                    }
                });
            });
        }

        //监听复选框事件
        table.on('checkbox(userTable)', function (obj) {
            console.log(obj.checked); //当前是否选中状态
            console.log(obj.data);    //选中行的相关数据
            console.log(obj.type);    //如果触发的是全选，则为：all，如果触发的是单选，则为：one
        });
        //监听单元格编辑
        table.on('edit(userTable)', function (obj) {//注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            console.log(obj.value);          //得到修改后的值
            console.log(obj.field);          //当前编辑的字段名
            console.log(obj.data);           //所在行的所有相关数据
            // $.post("url?"+obj.field+"&id="+obj.data.id,function(json){
            // });
        });
        //监听行单击事件
        table.on('row(userTable)', function (obj) {
            console.log(obj.tr); //得到当前行元素对象
            console.log(obj.data) //得到当前行数据
            // obj.del(); //删除当前行
            // obj.update(fields) //修改当前行数据
        });
        //监听工具条
        table.on('tool(userTable)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么？', {icon: 3, title: "提示"}, function (index) {
                    $.post("delete_Student.action", {stuId: data.stuId}, function (obj) {
                        layer.msg("删除成功！");
                        layer.close(layEvent);
                        tableIns.reload();      //刷新表格
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                openEdit(data);
            }
        });

        //打开编辑层
        var mainIndex;

        function openEdit(data) {
            mainIndex = layer.open({
                type: 1,
                title: '编辑学生表单',
                content: $("#openEdit"), //这里content是一个普通的String
                area: ['500px'],
                anim: 2,     //设置弹出动画
                btnAlign: 'c', //按钮对齐方式
                success: function () {
                    form.val("dataEdit", data);     //dataEdit为lay-filter的值
                    $("#editSele").val(data);
                    $.post("getOneStudent.action", {stuId: data.stuId}, function (obj) {
                        var server = document.getElementById("editSele"); //server为select定义的id
                        if (server.options.length == 4 || server.options.length == 3) {               //判断select标签中的option的长度
                            server.options.length = 0;                //若存在将其设置为0(清空option)，防止每次打开连续拼接append
                        }
                        for (var i in obj) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", obj[i].claId); // 给option的value添加值
                            option.innerText = obj[i].claName;     // 打印option对应的纯文本
                            server.appendChild(option);           //给select添加option子标签
                            form.render("select");            // 刷性select，显示出数据
                        }
                    });
                }
            });
            form.on('submit(doEdit)', function (data) {
                var params = $("#form2").serialize();
                $.post("edit_Student.action", params, function (obj) {
                    layer.msg("编辑成功！");
                    layer.close(mainIndex);     //关闭保存弹出层
                    tableIns.reload();           //刷新表格
                });
            });
        }

        $("#doClose").click(function () {
            layer.close(mainIndex);
        })
    });
</script>
</body>
</html>
