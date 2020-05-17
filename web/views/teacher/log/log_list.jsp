<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/11/21
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>学生信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <style>
        .code{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .code img{
            height: 320px;
            width: 320px;
        }
        .label-time{
            font-size: 25px;
            color: red;
        }
        .label-code{
            font-size: 30px;
            line-height: 30px;
        }
        .layui-form-select dl{
            max-height: 120px;
        }
    </style>
</head>
<body>
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>

<div style="display:none;" id="userToolBar">
    <div class="layui-inline">
        <input class="layui-input layui-icon" id="iname" list="nameList" placeholder="请输入班级编号" lay-event="searchInput" autocomplete="off">
        <datalist id="nameList"> </datalist>
    </div>
    <button class="layui-btn layui-btn-sm layui-icon" data-type="reload" lay-event="search">&#xe615; 搜索</button>

    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal layui-icon" lay-event="logAll">&#xe770; 全部点名</button>
    <button type="button" class="layui-btn layui-btn-sm layui-btn-warm layui-icon" lay-event="logRandom">&#xe66f; 随机点名</button>
    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger layui-icon" lay-event="logScan">&#xe678; 微信签到</button>
    <button type="button" class="layui-btn layui-btn-sm layui-icon" lay-event="log">&#xe63c; 考勤记录</button>
<%--    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal layui-icon" lay-event="reloadTable">&#xe666; 刷新</button>--%>
</div>

<%--点名班级弹出层--%>
<div style="display:none; padding-top: 20px; " id="openLogAll">
    <form class="layui-form" id="formLog" lay-filter="dataSave">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">班级:</label>
                <div class="layui-input-inline">
                    <select name="claId" lay-verify="required" lay-search="" id="logAllSele">
                    </select>
                </div>
            </div>
        </div>
        <div style="height:50px"></div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="doLog" id="doLog">&#xe609; 确认</button>
                <button type="button" class="layui-btn layui-icon layui-btn-primary" lay-submit lay-filter="closeLog" id="closeLog">&#x1006; 关闭</button>
            </div>
        </div>
    </form>
</div>
<%--查看弹出层表单--%>
<div style="display:none; padding-top: 20px; " id="openEdit">
    <form class="layui-form" id="form2" action="" lay-filter="dataEdit">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuId" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuName" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="stuSex" value="1" title="男" checked="">
                    <input type="radio" name="stuSex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuAddress" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="stuPhone" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">班级:</label>
                <div class="layui-input-inline">
                    <input type="text" name="claId" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">已到:</label>
                <div class="layui-input-inline">
                    <input type="text" name="logArrive" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">请假:</label>
                <div class="layui-input-inline">
                    <input type="text" name="logLeave" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">迟到:</label>
                <div class="layui-input-inline">
                    <input type="text" name="logLate" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">旷课:</label>
                <div class="layui-input-inline">
                    <input type="text" name="logAbsent" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="logDate" lay-verify="required" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="padding-left: 200px">
                <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-filter="doClose" id="doClose">&#x1006; 关闭</button>
            </div>
        </div>
    </form>
</div>
<%--选择时间--%>
<div style="display: none; padding-top: 20px" id="chooseTime">
    <form class="layui-form" id="formTime" lay-filter="dataSave">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">有效时间:</label>
                <div class="layui-input-inline">
                    <select name="claId" lay-verify="required" lay-search="" id="timeSelect">
                    </select>
                </div>
            </div>
        </div>
        <div style="height:50px"></div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="padding-left: 50px">
                <button type="button" class="layui-btn layui-btn-normal layui-icon" lay-submit lay-filter="doTime" id="doTime">&#xe609; 确认</button>
<%--                <button type="button" class="layui-btn layui-icon layui-btn-primary" lay-submit lay-filter="closeLog" id="closeTime">&#x1006; 关闭</button>--%>
            </div>
        </div>
    </form>
</div>
<%--显示二维码和验证码--%>
<div style="display: none" id="scanCode">
    <div class="code">
        <img src="../../../resources/images/log.png"/>
        <div class="code-check">
            签到码：
            <label class="label-code" id="checkCode">1234</label>
        </div>
        <div class="code-time">
            签到时间：
            <label class="label-time" id="timeCode">180</label>
            秒
        </div>
    </div>
</div>

<div id="userBar" style="display:none;">
    <a class="layui-btn layui-btn-sm layui-icon" lay-event="detail">&#xe655; 查看</a>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</div>
<script src="/resources/layui/layui.js"></script>
<script>
    layui.use(['element','jquery','layer','form','table', 'laytpl'], function(){
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laytpl = layui.laytpl;

        //渲染表格
        var tableIns = table.render({
            elem: '#userTable'          //对应的id
            ,url: 'findStudent.action'  //数据接口
            ,title: '考勤数据表'         //数据文件导出来的标题
            ,toolbar:"#userToolBar"     //表头的工具条
            ,defaultToolbar: ['filter', {
                 title: '导出Excel'      //标题
                ,layEvent: 'logExcel'    //事件名，用于 toolbar 事件中使用
                ,icon: 'layui-icon-download-circle' //图标类名
            },{                          //右上边图标['filter','print', 'exports']
                title: '刷新'
                ,layEvent: 'reloadTable'
                ,icon: 'layui-icon-refresh-1'
            }]
            // ,totalRow:true           //开启底部合计
            ,page: true                 //是否分页
            ,limit: 100
            ,limits:[10,20,30,40,50]    //每页条数的选中
            ,cols: [[
                 {field:'stuId', title:'学号',sort:true,align:'center'}
                ,{field:'stuName', title:'姓名',align:'center'}
                ,{field:'claId', title:'班级编号',sort: true,align:'center'}
                ,{field:'logArrive', title:'已到',align:'center', templet: function(d){
                        return d.logArrive==null?0:d.logArrive;
                    }}
                ,{field:'logLeave', title:'请假',align:'center', templet:function(d){
                        return d.logLeave==null?0:d.logLeave;
                    }}
                ,{field:'logLate', title:'迟到',align:'center', templet:function(d){
                        return d.logLate==null?0:d.logLate;
                    }}
                ,{field:'logAbsent', title:'旷课',align:'center', templet:function(d){
                        return d.logAbsent==null?0:d.logAbsent;
                    }}
                ,{field:'logDate', title:'时间',sort: true,align:'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#userBar', width:150,align:'center'}
            ]]
        });
        //监听上部工具栏事件
        table.on('toolbar(userTable)', function(obj){
            switch(obj.event){
                case 'searchInput':
                    searchInput();
                    break;
                case 'search':
                    search();
                    break;
                case 'reloadTable':
                    tableIns.reload();      //括号中可以放{resources/json/teacher.json}json的请求地址
                    break;
                case 'logAll':      //点名全部
                    logAll();
                    break;
                case 'logRandom':   //随机点名
                    logRandom();
                    break;
                case 'logScan':     //微信签到
                    chooseTime();
                    break;
                case 'log':         //考勤记录
                    log();
                    break;
                case 'logExcel':    //导出Excel
                    logExcel();
                    break;
            }
        });

        //搜索输入
        function searchInput(){
            $("#iname").keyup(function(){
                $("#nameList option").remove();     //清空dataList标签中的选项
                var param = {claId:($("#iname").val()==""?0:$("#iname").val())};
                $.post("searchByClaIdStudent.action", param, function(data){
                    var list = "";
                    var arr = new Array();
                    for(var i in data){    //去除重复元素
                        if(arr.indexOf(data[i].claId) == -1){
                            arr.push(data[i].claId);
                            list += "<option value='"+arr[arr.length-1]+"'></option>"
                        }
                    }
                    $("#nameList").html(list);
                })
            });
        }

        //搜索单击事件
        function search(){
            var iname = $("#iname").val();
            if(iname == "" || iname == null){
                layer.msg("请输入数据！!", {icon : 5});
            }else{
                tableIns.reload({                   //重载表格
                    url : "searchBtnByClaIdStudent.action",//重载的路径
                    where : {claId : iname}       //重载需要携带的数据，可以多个
                });
            }
        }

        // 选择班级弹出层
        var openLog;
        function openLayer(){
             openLog = layer.open({
                type: 1,
                title: '选择班级',
                content: $("#openLogAll"), //这里content是一个普通的String
                area:['450px','250px'],
                offset:'150px',
                anim: 2,     //设置弹出动画
                btnAlign:'c', //按钮对齐方式
                success:function(){
                    $.post("findClaLog.action", function(data){
                        var server = document.getElementById("logAllSele");
                        //判断该节点是否为空，若不为空将其清除，后面回调函数会将其添加
                        if(server.value != null && server.value != ""){
                            server.remove();
                        }
                        for(var i in data){
                            var option = document.createElement("option");  //创建属性
                            option.setAttribute("value", data[i].claId);    //给option的value添加值
                            option.innerText = data[i].claName; //给option赋值对应的文本
                            server.appendChild(option);         //给select添加option子标签
                            form.render("select");              //刷新select，显示数据
                        }
                    })
                }
            });
        }

        // 关闭点名弹出
        form.on('submit(closeLog)', function(){
            layer.close(openLog);
        });

        // 提交全部点名弹出层
        function logAll(){
            openLayer();
            //提交弹出
            form.on('submit(doLog)', function(){
                var param = $("#logAllSele").val();
                window.location.href = "logAllList_Log.action?claId="+param;
            });
        }

        // 提交随机点名弹出层
        function logRandom(){
            openLayer();
            //提交弹出
            form.on('submit(doLog)', function(){
                var param = $("#logAllSele").val();
                window.location.href = "logRandomList_Log.action?claId="+param;
            });
        }

        // 拼接下拉列表
        function opt(val, text, sel){
            var option = document.createElement("option");
            option.value = val;
            option.text = text;
            sel.options.add(option);
            form.render("select");
        }

        // 选择有效时间
        function chooseTime(){
            var openTime = layer.open({
                type: 1,
                title: "<span class='layui-icon'>&#xe665; 设置有效时间</span>",
                content: $("#chooseTime"),
                area: ['450px', '250px'],
                anim: 2,
                offset: '100px',
                success: function(){
                    var sel = document.getElementById("timeSelect");
                    for(var i=1; i<=45; i++){
                        opt(i, i+'分钟', sel);
                    }
                    $.post("destroyCode_log.action", function(res){
                    })
                }
            });
            // 提交有效时间
            form.on('submit(doTime)', function(){
                var time = $("#timeSelect").val()*60;
                // alert(time);
                $.post("logCode_log.action", {time: time}, function(res){
                    $("#checkCode").css("color", "").text(res.code);
                    $("#timeCode").text(time);
                    layer.close(openTime);
                    logScan();
                    time = 10;

                    // 动态显示有效时间
                    var inter = setInterval(function(){
                        if(time === 0){             // 当时间为0时，停止
                            clearInterval(inter);
                            $("#checkCode").css("color", "red").text("已失效！");
                        }
                        $("#timeCode").text(time--);
                    }, 1000);
                    // clearInterval(inter);
                })
            });
        }

        // 微信签到
        function logScan(){
            layer.open({
                type: 1,
                title: "<span class='layui-icon'>&#xe678; 微信签到</span>",
                // content: '/resources/images/log.png',
                content: $("#scanCode"),
                area:['400px','450px'],
                offset:'50px',
                anim: 4,      //设置弹出动画
                success: function(){
                    // $.post("")
                    // var code = $("#checkCode").text();
                    // alert(code);
                }
            })
        }

        // 考勤记录
        function log(){
            // window.location.href = "findAllList_Log.action";
            layer.open({
                type: 2,
                title: '考勤记录',
                content: "/views/teacher/log/log_record.jsp",
                area:['1200px','600px'],
                offset:'50px',
                anim: 2      //设置弹出动画
            });
        }

        //选择班级提交导出excel表
        function logExcel(){
            openLayer();
            form.on('submit(doLog)', function(){
                var param = $("#logAllSele").val();
                window.location.href = "logExcel_Log.action?claId="+param;
            });
        }

        //监听工具条
        table.on('tool(userTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                if(layEvent === 'detail') { //编辑
                openEdit(data);
            }
        });

        //打开详情弹出层
        var mainIndex ;
        function openEdit(data){
            mainIndex = layer.open({
                type: 1,
                title: '学生详情信息',
                content: $("#openEdit"), //这里content是一个普通的String
                area:['750px'],
                offset:'50px',
                anim: 2,     //设置弹出动画
                btnAlign:'c', //按钮对齐方式
                success:function(){
                    form.val("dataEdit", data);     //dataEdit为lay-filter的值
                    $("#editSele").val(data);
                    var html = "";
                    $.post("getOneStudent.action", {stuId : data.stuId}, function(obj){
                        var server = document.getElementById("editSele"); //server为select定义的id
                        for(var i in obj) {
                            var option = document.createElement("option");  // 创建添加option属性
                            option.setAttribute("value", obj[i].claId); // 给option的value添加值
                            option.innerText = obj[i].claId;     // 打印option对应的纯文本
                            server.appendChild(option);           //给select添加option子标签
                            form.render("select");            // 刷性select，显示出数据
                        }
                    });
                }
            });
            form.on('submit(doEdit)', function(data){
                var params = $("#form2").serialize();
                $.post("edit_Student.action",params,function(obj){
                    layer.msg("编辑成功！");
                    layer.close(mainIndex);     //关闭保存弹出层
                    tableIns.reload();           //刷新表格
                });
            });
        }
        $("#doClose").click(function(){
            layer.close(mainIndex);
        })
    });
</script>
</body>
</html>
