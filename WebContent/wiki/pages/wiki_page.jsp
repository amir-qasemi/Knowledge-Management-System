<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>wiki</title>

<!-- include bootstrap file -->
<%@ include file="../includs/template/css_includs_template.jsp"%>

<!-- page custom style -->
<link href="wiki/css/wiki_custom_style/wiki_style.css" rel="stylesheet">

</head>
<body style="background-color: white">

	<div id="wrapper">

		<!-- including navigation bar -->
		<%@ include file="../includs/nav_bar/wiki_nav_bar.jsp"%>


		<div class="col col-xs-4">
			<!-- include side bar -->
			<%@ include file="../includs/side_bar/wiki_side_bar.jsp"%>
		</div>
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12">
							<a href="#menu-toggle" id="menu-toggle"
								class="fa fa-angle-double-left"></a>
						</div>
						<div class="col-xs-12">
							<div class="col-xs-12">

								<div class="panel panel-info itemize">
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-12">
												<i class="fa fa-won fa-5x fa-wiki"></i>
												<div class="pull-right">
													<h1>Wiki</h1>
												</div>
												<div class="col-xs-12">
													<div class="col col-xs-6"
														style="background-color: lavender;" id="userName">
														<i class="glyphicon glyphicon-subtitles"></i> page title :
														<s:property value="page.page_title" />
													</div>
													<div class="col col-xs-6"
														style="background-color: lavender;">
														<i class="glyphicon glyphicon-time"></i> Page activity
														time stamp :
														<s:property value="page.page_activity_timestamp" />
													</div>
													<div class="col col-xs-6"
														style="background-color: lavender;">
														<i class="glyphicon glyphicon-time"></i> page create date
														:
														<s:property value="page.page_touched" />
													</div>
													<div class="col col-xs-6"
														style="background-color: lavender;">
														<i class="fa fa-cubes"></i> page last activity type:
														<s:property value="page.page_activity_type" />
													</div>
													<div class="col col-xs-6"
														style="background-color: lavender;">
														<i class="fa fa-user"></i> page last activity user name :
														<s:property value="page.page_activity_user" />
													</div>
													<div class="col col-xs-6"
														style="background-color: lavender;">
														<i class="fa fa-send"></i>
														<button type="submit" class="btn btn-link"
															style="color: black;">send message for page
															activity user</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="panel-body">

										<!-- this dive must change for accepting other page in this section with AJAX -->
										<div class="wiki-text">
											<s:property value="page.page_activity_content"
												escapeHtml="page.page_activity_content" />
										</div>

										<!-- visoalEdito dive -->
										<div class="EditorDiv" id="EditorDiv">
											<div class="EditorDiv" id="EditorDiv">
												<div class="col col-xs-12">
													<div class="panel panel-primary" id="visualEditor">
														<div class="panel-heading">
															<h4>
																Edit : <i class="glyphicon glyphicon-pencil pull-right"
																	style="line-height: 5px; font-size: 36px"></i>
															</h4>
														</div>
														<div class="panel-body">
															<form>
																<br>
																<textarea name="editor1" id="editor1" rows="10"
																	cols="80"></textarea>
																<br>
																<div class="pull-right">
																	<input type="submit" style="visibility: hidden;">
																	<button class="btn btn-primary" id="saveChangesBtn">Save</button>
																	<button class="btn btn-danger" id="cancelChangesBtn">Cancel</button>
																</div>
															</form>
														</div>
													</div>

													<script src="visual_editor/ckeditor/ckeditor.js"></script>
												</div>
											</div>
										</div>
										<!-- / visoalEdito dive -->

									</div>
								</div>

								<div class="chat-panel panel panel-default">
									<div class="panel-heading">
										<i class="fa fa-comments fa-fw"></i> Chat
										<div class="btn-group pull-right">
											<button type="button"
												class="btn btn-default btn-xs dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false">
												<i class="fa fa-chevron-down"></i>
											</button>
											<ul class="dropdown-menu slidedown">
												<li><a href="#"> <i class="fa fa-refresh fa-fw"></i>
														Refresh
												</a></li>
												<li><a href="#"> <i
														class="fa fa-check-circle fa-fw"></i> Available
												</a></li>
												<li><a href="#"> <i class="fa fa-times fa-fw"></i>
														Busy
												</a></li>
												<li><a href="#"> <i class="fa fa-clock-o fa-fw"></i>
														Away
												</a></li>
												<li class="divider"></li>
												<li><a href="#"> <i class="fa fa-sign-out fa-fw"></i>
														Sign Out
												</a></li>
											</ul>
										</div>
									</div>
									<!-- /.panel-heading -->
									<div class="panel-body">
										<ul class="chat">
											<s:iterator status="stat" value="comments">
												<li class="left clearfix">
													<div class="chat-body clearfix">
														<div class="header">
															<strong class="primary-font"><s:property
																	value="userName" /></strong> <small
																class="pull-right text-muted"> <i
																class="fa fa-clock-o fa-fw"></i> <s:property
																	value="writtenDate" />
															</small>
														</div>
														<p>
															<s:property value="content" />
															.
														</p>
													</div>
												</li>
											</s:iterator>
										</ul>
									</div>
									<!-- /.panel-body -->
									<div class="panel-footer">
										<form action="registerComment" method="post">
											<div style="visibility: hidden;">
												<input type="text" name="comment_page"
													value='<s:property value="page.page_title"/>'>
											</div>
											<div class="input-group">
												<input id="btn-input" type="text"
													class="form-control input-sm" name="comment_content"
													id="comment" placeholder="Type your message here...">
												<span class="input-group-btn">
													<button type="submit" class="btn btn-warning btn-sm"
														id="btn-chat">Send</button>
												</span>
											</div>
										</form>
									</div>
									<!-- /.panel-footer -->
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>

	<!-- page JQuery is in this page -->
	<%@ include file="../js/wiki_page/control/wiki_page_add_query.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>