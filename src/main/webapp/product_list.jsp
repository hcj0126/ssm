<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>产品列表页</title>
    <meta name="description" content="SSM系统">
    <meta name="keywords" content="SSM系统">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

    <div class="wrapper">

        <!-- 页面头部 -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- 页面头部 /-->

       <!-- 导航侧栏 -->
       <jsp:include page="sidebar.jsp"></jsp:include>
       <!-- 导航侧栏 /-->

        <!-- 内容区域 -->
        <div class="content-wrapper" style="margin-top: 50px">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    产品管理
                    <small>全部产品</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">数据管理</a></li>
                    <li class="active">产品列表</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">产品列表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="添加">
                                            <i class="fa fa-file-o"></i> 添加
                                        </button>
                                        <button id="batchDeleteProductId" type="button" class="btn btn-default" title="下架">
                                            <i class="fa fa-trash-o"></i> 删除
                                        </button>
                                        <button type="button" class="btn btn-default" title="开启">
                                            <i class="fa fa-trash-o"></i> 开启
                                        </button>
                                        <button type="button" class="btn btn-default" title="关闭">
                                            <i class="fa fa-trash-o"></i> 关闭
                                        </button>
                                        <button type="button" class="btn btn-default" title="刷新">
                                            <i class="fa fa-refresh"></i> 刷新
                                        </button>
                                    </div>
                                </div>
                            </div>
							
							
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm" placeholder="搜索">
									<a href="#">
										<span class="glyphicon glyphicon-search form-control-feedback"></span>
									</a>
								</div>
							</div>
                            <!--工具栏 -->

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        <th class="sorting_asc">ID</th>
                                        <th class="sorting">产品编号</th>
                                        <th class="sorting">产品名称</th>
                                        <th class="sorting">出发城市</th>
                                        <th class="sorting">出发时间</th>
                                        <th class="sorting">产品价格</th>
                                        <th class="sorting">产品描述</th>
                                        <th class="sorting">状态</th>

                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                
								<tbody>
									<c:forEach items="${pageInfo.list}" var="p">
                                        <tr>
                                            <td><input name="ids" type="checkbox" value="${p.id}"></td>
                                            <td>${p.id}</td>
                                            <td>${p.productNum}</td>
                                            <td>${p.productName}</td>
                                            <td>${p.cityName}</td>
                                            <td>${p.departureTime}</td>
                                            <td>${p.productPrice}</td>
                                            <td>${p.productDesc}</td>
                                            <td>${p.productStatusStr}</td>
                                            <td class="text-center">
                                                <button type="button" class="btn bg-olive btn-xs">编辑</button>
                                                <button type="button" class="btn bg-olive btn-xs">删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <!-- .box-footer-->
                    <div class="box-footer">
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                总共2页，共14条数据。 每页
                                <select class="form-control">
									<option>10</option>
									<option>15</option>
									<option>20</option>
								</select> 条
                            </div>
                        </div>

                        <div class="box-tools pull-right">
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">首页</a>
                                </li>
                                <li><a href="#">上一页</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">下一页</a></li>
                                <li>
                                    <a href="#" aria-label="Next">末页</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.box-footer-->


                </div>

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <jsp:include page="foot.jsp"></jsp:include>
        <!-- 底部导航 /-->

    </div>


    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale: 'zh-CN'
            });
        });


        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }


        $(document).ready(function() {

            // 激活导航位置
            setSidebarActive("order-manage");

            // 列表按钮 
            $("#dataList td input[type='checkbox']").iCheck({
                checkboxClass: 'icheckbox_square-blue',
                increaseArea: '20%'
            });
            // 全选操作 
            $("#selall").click(function() {
                var clicks = $(this).is(':checked');
                if (!clicks) {
                    $("#dataList td input[type='checkbox']").iCheck("uncheck");
                } else {
                    $("#dataList td input[type='checkbox']").iCheck("check");
                }
                $(this).data("clicks", !clicks);
            });
        });

        $(function(){
            // 给删除按钮绑定一个点击事件
            $("#batchDeleteProductId").on('click',function(){
                //alert(1);
                if(confirm("你确定要删除吗?")){
                    var ids = new Array();
                    // console.log(ids);
                    $("input[name='ids']:checked").each(function(){
                        // 把选择的每个选框加入到数组中
                        ids.push($(this).val());
                    });
                }
                // console.log(ids);
                // 把ids传到后台中
                location.href="${pageContext.request.contextPath}/product/batchProductByIds?ids="+ids;
            })
        })
    </script>
</body>

</html>