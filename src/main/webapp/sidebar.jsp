<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p></p>
                <a href="#"><i class="fa fa-circle text-success"></i>${user.username} 在线</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index">
                <a href="${pageContext.request.contextPath}/main.jsp">
                    <i class="fa fa-dashboard"></i> <span>首页</span>
                </a>
            </li>

            <!-- 菜单 -->
            <li class="treeview">
                <a href="">
                    <i class="fa fa-cube"></i> <span>系统管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>

                <ul class="treeview-menu">

                    <li id="user-manage">
                        <a href="${pageContext.request.contextPath}/user/findUserListByPage?pageNum=1&pageSize=5">
                            <i class="fa fa-circle-o"></i> 用户管理
                        </a>
                    </li>

                    <li id="role-manager">
                        <a href="${pageContext.request.contextPath}/role/findRoleList">
                            <i class="fa fa-circle-o"></i> 角色管理
                        </a>
                    </li>

                    <li id="permission-manager">
                        <a href="${pageContext.request.contextPath}/permission/findPermissionList">
                            <i class="fa fa-circle-o"></i> 资源权限管理
                        </a>
                    </li>

                    <li id="log-manager">
                        <a href="">
                            <i class="fa fa-circle-o"></i> 访问日志
                        </a>
                    </li>
                </ul>
            </li>



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-book"></i> <span>数据管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>

                <ul class="treeview-menu">

                    <li id="product-manage">
                        <a href="${pageContext.request.contextPath}/product/findProductListByPage?pageNum=1&pageSize=5">
                            <i class="fa fa-circle-o"></i> 产品列表
                        </a>
                    </li>

                    <li id="order-manage">
                        <a href="${pageContext.request.contextPath}/order_list.jsp">
                            <i class="fa fa-circle-o"></i> 订单列表
                        </a>
                    </li>

                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->

