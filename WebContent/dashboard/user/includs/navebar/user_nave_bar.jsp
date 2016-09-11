<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<ul class="navbar">
	<li><button id="menu-toggle"
			type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button></li>

	<li><a class="active" href="">Home <i class="fa fa-home"></i></a></li>
	<li><a href="">News</a></li>
	<li><a href="">Contact</a></li>
	<li><a href="">About</a></li>
	<li class="pull-right"><button type="button"
			class="btn btn-outline btn-danger signout" value="SignOut"
			id="submit">
			<i class="fa fa-sign-out fa-fw"></i> Signout
		</button></li>
</ul>