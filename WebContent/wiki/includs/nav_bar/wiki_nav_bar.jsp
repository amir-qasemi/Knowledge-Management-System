<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<ul class="navbar">
	<li><a class="active" href="">Home <i class="fa fa-home"></i></a></li>
	<li><a href="">News</a></li>
	<li><a href="">Contact</a></li>
	<li><a href="">About</a></li>
	<li class="pull-right"><button type="button"
			class="btn btn-outline btn-danger signout" value="SignOut"
			id="submit">
			<i class="fa fa-sign-out fa-fw"></i> Signout
		</button></li>
	<li class="pull-right">
		<form action="dashboardRedirect" method="post">
			<button type="submit" class="btn btn-outline btn-success">
				<i class="fa fa-step-backward"></i> Dashboard <i
					class="fa fa-dashboard"></i>
			</button>
		</form>
	</li>
</ul>