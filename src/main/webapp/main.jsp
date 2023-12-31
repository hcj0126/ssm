<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SSM后台权限管理系统</title>
    <meta name="description" content="SSM系统">
    <meta name="keywords" content="SSM系统">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 页面meta /-->
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
        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    系统管理
                </h1>
            </section>
            <!-- 内容头部 /-->


            <!-- 正文区域 -->
            <section class="content">

                <!-- 统计数值 -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>150</h3>

                                <p>新订单</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="all-order-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px">%</sup></h3>

                                <p>转化率</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>44</h3>

                                <p>新注册用户</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="all-member-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>65</h3>

                                <p>日PV</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
				

                <!-- 待处理订单 -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-cube"></i>
                        <h3 class="box-title">待处理订单</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                    <tr>
                                        <th class="">订单号</th>
                                        <th class="">产品名称</th>
                                        <th class="">会员</th>
                                        <th class="">价格</th>
                                        <th class="">状态</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>2017020200001</td>
                                        <td>西安3日自由行·超级自由行</td>
                                        <td>bi'peng0405</td>
                                        <td>￥500</td>
                                        <td>已取消</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2017020200001</td>
                                        <td>西安3日自由行·超级自由行</td>
                                        <td>bi'peng0405</td>
                                        <td>￥500</td>
                                        <td>已出团(待点评)</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2017020200001</td>
                                        <td>西安3日自由行·超级自由行</td>
                                        <td>bi'peng0405</td>
                                        <td>￥500</td>
                                        <td>已处理(待付款)</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2017020200001</td>
                                        <td>西安3日自由行·超级自由行</td>
                                        <td>bi'peng0405</td>
                                        <td>￥500</td>
                                        <td>已处理(待出团)</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2017020200001</td>
                                        <td>西安3日自由行·超级自由行</td>
                                        <td>bi'peng0405</td>
                                        <td>￥500</td>
                                        <td>已取消</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2017020200001</td>
                                        <td>西安3日自由行·超级自由行</td>
                                        <td>bi'peng0405</td>
                                        <td>￥500</td>
                                        <td>已取消</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                            <!--数据列表/-->

                        </div>
                        <!-- 数据表格 /-->

                    </div>
                    <!-- /.box-body -->

                </div>
                <!-- 待处理订单 /-->

                <!-- 待处理游记 -->
                <div class="box box-success">
                    <div class="box-header with-border">
                        <i class="fa fa-book"></i>
                        <h3 class="box-title">待处理游记</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                    <tr>
                                        <th class="">会员昵称</th>
                                        <th class="">游记标题</th>
                                        <th class="">发布时间</th>
                                        <th class="">状态</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>大王叫我来巡山</td>
                                        <td>毕大爷带你游西安（附详细攻略）</td>
                                        <td>2017-03-07 17:45</td>
                                        <td>待审核</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>大王叫我来巡山</td>
                                        <td>毕大爷带你游西安（附详细攻略）</td>
                                        <td>2017-03-07 17:45</td>
                                        <td>已发布</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>大王叫我来巡山</td>
                                        <td>毕大爷带你游西安（附详细攻略）</td>
                                        <td>2017-03-07 17:45</td>
                                        <td>待审核</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>大王叫我来巡山</td>
                                        <td>毕大爷带你游西安（附详细攻略）</td>
                                        <td>2017-03-07 17:45</td>
                                        <td>待审核</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>大王叫我来巡山</td>
                                        <td>毕大爷带你游西安（附详细攻略）</td>
                                        <td>2017-03-07 17:45</td>
                                        <td>待审核</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>编辑</button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>大王叫我来巡山</td>
                                        <td>毕大爷带你游西安（附详细攻略）</td>
                                        <td>2017-03-07 17:45</td>
                                        <td>待审核</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>编辑</button>
                                        </td>
                                    </tr>


                                </tbody>
                            </table>
                            <!--数据列表/-->

                        </div>
                        <!-- 数据表格 /-->

                    </div>
                    <!-- /.box-body -->

                </div>
                <!-- 待处理游记 /-->

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
            setSidebarActive("admin-index");
        });
    </script>
</body>

</html>
<!---->