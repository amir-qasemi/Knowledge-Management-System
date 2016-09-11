<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>404</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

<%@ include file="../includs/css_includs.jsp"%>

</head>
<body>

	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->

			<div class="error-container">
				<div class="well">
					<h1 class="grey lighter smaller">
						<span class="blue bigger-125"> <i
							class="ace-icon fa fa-sitemap"></i> 404
						</span> Page Not Found
					</h1>

					<hr>
					<h3 class="lighter smaller">We looked everywhere but we
						couldn't find it!</h3>

					<div>
						<form class="form-search">
							<span class="input-icon align-middle"> <i
								class="ace-icon fa fa-search"></i> <input type="text"
								class="search-query" placeholder="Give it a search...">
							</span>
							<button class="btn btn-sm" type="button">Go!</button>
						</form>

						<div class="space"></div>
						<h4 class="smaller">Try one of the following:</h4>

						<ul class="list-unstyled spaced inline bigger-110 margin-15">
							<li><i class="ace-icon fa fa-hand-o-right blue"></i>
								Re-check the url for typos</li>

							<li><i class="ace-icon fa fa-hand-o-right blue"></i> Read
								the faq</li>

							<li><i class="ace-icon fa fa-hand-o-right blue"></i> Tell us
								about it</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
</body>
</html>