<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>数据 - SSM后台权限管理系统</title>
<meta name="description" content="用户管理">
<meta name="keywords" content="用户管理">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
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
				用户管理 <small>全部用户</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/findUserList">用户管理</a></li>

				<li class="active">全部用户</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/user_add.jsp'" title="新建">
											<i class="fa fa-file-o"></i> 新建
										</button>

										<button type="button" class="btn btn-default" title="刷新"
												onclick="window.location.reload();">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input id="seach_input" type="text" class="form-control input-sm" placeholder="根据用户名搜索" />
									<span class="glyphicon glyphicon-search form-control-feedback" ></span>
									<button id="seachId">搜索</button>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">用户名</th>
										<th class="sorting_asc sorting_asc_disabled">邮箱</th>
										<th class="sorting_desc sorting_desc_disabled">联系电话</th>
										<th class="sorting">状态</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>
									<%--<c:forEach items="${userList}" var="user">
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>${user.id}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
											<td>${user.phone}</td>
											<td>${user.statusStr}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/user/findUserById?id=${user.id}" class="btn bg-olive btn-xs">详情</a>
												<a href="${pageContext.request.contextPath}/user/findUserByIdAndOtherAllRoles?id=${user.id}" class="btn bg-olive btn-xs">添加角色</a>
											</td>
										</tr>
									</c:forEach>--%>
									<c:forEach items="${pageInfo.list}" var="user">
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>${user.id}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
											<td>${user.phone}</td>
											<td>${user.statusStr}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/user/findUserById?id=${user.id}" class="btn bg-olive btn-xs">详情</a>
												<a href="${pageContext.request.contextPath}/user/findUserByIdAndOtherAllRoles?id=${user.id}" class="btn bg-olive btn-xs">添加角色</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。 每页
								<select class="form-control" id="changePageSizeId">
									<option value="5" <c:if test="${pageInfo.pageSize eq 5}">selected</c:if> >5</option>
									<option value="10" <c:if test="${pageInfo.pageSize eq 10}">selected</c:if> >10</option>
								    <option value="15" <c:if test="${pageInfo.pageSize eq 15}">selected</c:if> >15</option>
								</select> 条
							</div>
						</div>

						<div class="box-tools pull-right">
							<ul class="pagination">
								<li><a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageRow">
									<c:if test="${pageInfo.pageNum eq pageRow}">
										<li class="active"><a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=${pageRow}&pageSize=${pageInfo.pageSize}">${pageRow}</a></li>
									</c:if>
									<c:if test="${pageInfo.pageNum != pageRow}">
										<li><a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=${pageRow}&pageSize=${pageInfo.pageSize}">${pageRow}</a></li>
									</c:if>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->

				</div>

				</section>
				<!-- 正文区域 /-->

			</div>
			<!-- @@close -->
			<!-- 内容区域 /-->

			<!-- 底部导航 -->
			<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Copyright &copy; 2014-2023 <a
				href="">研发部</a>.
			</strong> All rights reserved. </footer>
			<!-- 底部导航 /-->

		</div>

		<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="../plugins/raphael/raphael-min.js"></script>
		<script src="../plugins/morris/morris.min.js"></script>
		<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
		<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script src="../plugins/knob/jquery.knob.js"></script>
		<script src="../plugins/daterangepicker/moment.min.js"></script>
		<script src="../plugins/daterangepicker/daterangepicker.js"></script>
		<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
		<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
		<script
			src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script
			src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script src="../plugins/fastclick/fastclick.js"></script>
		<script src="../plugins/iCheck/icheck.min.js"></script>
		<script src="../plugins/adminLTE/js/app.min.js"></script>
		<script src="../plugins/treeTable/jquery.treetable.js"></script>
		<script src="../plugins/select2/select2.full.min.js"></script>
		<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script
			src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
		<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script
			src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
		<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="../plugins/ckeditor/ckeditor.js"></script>
		<script src="../plugins/input-mask/jquery.inputmask.js"></script>
		<script
			src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../plugins/chartjs/Chart.min.js"></script>
		<script src="../plugins/flot/jquery.flot.min.js"></script>
		<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
		<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
		<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
		<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
		<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
		<script>
			$(document).ready(function() {
				// 选择框
				$(".select2").select2();

				// WYSIHTML5编辑器
				$(".textarea").wysihtml5({
					locale : 'zh-CN'
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
			// 标准的页面加载函数
			$(document).ready(function() {
				// 激活导航位置
				setSidebarActive("admin-datalist");

				// 列表按钮
				$("#dataList td input[type='checkbox']").iCheck({
						checkboxClass : 'icheckbox_square-blue',
						increaseArea : '20%'
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

			// 简写的页面加载函数
			$(function(){
				// 给改变分页的每页记录条数的下拉框绑定区域改变事件
				$("#changePageSizeId").on('change',function(){
					// alert(1);
					var $pageSize = $(this).val();
					// alert($pageSize);
					// 把$pageSize的值传到后台
					location.href="${pageContext.request.contextPath}/user/findUserListByPage?pageSize="+$pageSize+"&pageNum=${pageInfo.pageNum}";
				})
			})
			$(function(){
				// 给搜索放大镜绑定点击事件
				$("#seachId").on('click',function(){
					// alert(1);
					// 获取搜索文本框的值
					var $seachInputValue = $("#seach_input").val();
					// alert($seachInputValue);
					location.href="${pageContext.request.contextPath}/user/findUserListByPage?pageSize=${pageInfo.pageSize}&pageNum=${pageInfo.pageNum}&seach="+$seachInputValue;
				})
			})
		</script>
</body>

</html>
