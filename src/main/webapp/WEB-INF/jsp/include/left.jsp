<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/19
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@include file="js.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<div id="sidebar" class="sidebar">

    <ul class="nav nav-list">
        <li class="">
            <a href="#">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> 总控制台 </span>
            </a>
        </li>

        <li class="active open">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-desktop"></i>
                <span class="menu-text"> UI &amp; 元素 </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">

                <li class="">
                    <a href="userlist" target="right">
                        <i class="menu-icon fa fa-caret-right"></i>
                        排版
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="userlist">
                        <i class="menu-icon fa fa-caret-right"></i>
                        UI元素
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-caret-right"></i>
                        三级菜单
                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="#">
                                <i class="menu-icon fa fa-leaf green"></i>
                                第一级
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="#" class="dropdown-toggle">
                                <i class="menu-icon fa fa-pencil orange"></i>

                                第四级
                                <b class="arrow fa fa-angle-down"></b>
                            </a>

                            <b class="arrow"></b>

                            <ul class="submenu">
                                <li class="">
                                    <a href="#">
                                        <i class="menu-icon fa fa-plus purple"></i>
                                        添加商品
                                    </a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="#">
                                        <i class="menu-icon fa fa-eye pink"></i>
                                        查看商品
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>




        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-tag"></i>
                <span class="menu-text"> 更多页面 </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="">
                    <a href="profile.html">
                        <i class="menu-icon fa fa-caret-right"></i>
                        用户信息
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="pricing.html">
                        <i class="menu-icon fa fa-caret-right"></i>
                        售价单
                    </a>

                    <b class="arrow"></b>
                </li>
            </ul>
        </li>


    </ul><!-- /.nav-list -->


    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

</div>
