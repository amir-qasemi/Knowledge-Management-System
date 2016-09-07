<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPage</title>

<%@ include
	file="../includs/template/new_css_admin_dashboard_include.jsp"%>

</head>
<!-- /head -->
<body class="no-skin">

	<!-- navigation bar -->
	<%@ include file="../includs/new_side_bar_and_nav_bar/new_nave_bar.jsp"%>

	<div class="main-container ace-save-state" id="main-container">

		<!-- side bar -->
		<%@ include
			file="../includs/new_side_bar_and_nav_bar/new_side_bar.jsp"%>

		<div class="main-content">
			<div class="main-content-inner">

				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- heading -->
							<div class="page-header">
								<h1>Admin dashboard</h1>
							</div>

							<!-- ---------------------------- panels -->
							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-dark">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Send message</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>Send message dive : your message after sending show
													for all of user !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-envelope"></i>
											</div>
										</div>

										<div>
											<a href="sendMessageRedirect"
												class="btn btn-block btn-inverse"> <span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-orange">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">See received
											messages</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>See message dive : show to you all of messages that
													received from users !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-maxcdn"></i>
											</div>
										</div>

										<div>
											<a href="seeMesaages" class="btn btn-block btn-warning">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-blue">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Upload file</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>upload file dive : this dive provided for upload
													your files for other users !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-upload"></i>
											</div>
										</div>

										<div>
											<a href="sendFileRedirect" class="btn btn-block btn-primary">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-red">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">See uploaded
											files</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>see uploaded file dive : this dive provided for see
													uploaded files for other users !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="fa fa-download"></i>
											</div>
										</div>

										<div>
											<a href="seeUploadedFiles" class="btn btn-block btn-danger">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-green">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Wiki</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>Wiki dive : this dive provided to create your wiki
													<br />!
												</li>
											</ul>

											<hr>
											<div class="price">
												<i class="menu-icon fa fa-stack-overflow"></i>
											</div>
										</div>

										<div>
											<a href="wikiPage" class="btn btn-block btn-success"> <span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-sm-4 pricing-box">
								<div class="widget-box widget-color-pink">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">Project</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<ul class="list-unstyled spaced2">
												<li>Project dive :create your project and use them with
													your coleague in a party !</li>
											</ul>

											<hr>
											<div class="price">
												<i class="menu-icon glyphicon glyphicon-th-list"></i>
											</div>
										</div>

										<div>
											<a href="projectRedirect" class="btn btn-block btn-pink">
												<span>See</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- -----------------------------/panels -->
						</div>
					</div>

					<br />
					<!-- heading -->
					<div class="page-header">
						<h1>Received request for register</h1>
					</div>

					<!-- ------------------------- request table -->

					<div class="col-xs-12 col-sm-3 widget-container-col ui-sortable"
						id="widget-container-col-6">

						<div class="widget-box widget-color-dark ui-sortable-handle"
							id="widget-box-8">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									<!-- add request_date here -->
								</h5>
							</div>

							<div class="widget-body">
								<div class="widget-toolbox" id="widget-toolbox-1">
									<div class="btn-toolbar">
										<div class="btn-group">
											<button class="btn btn-sm btn-success btn-white btn-round">
												<i class="ace-icon fa fa-check bigger-110 green"></i>
												Approve
											</button>

											<button class="btn btn-sm btn-danger btn-white btn-round">
												<i class="ace-icon fa fa-times bigger-110 red2"></i> Reject
											</button>
										</div>
									</div>
								</div>

								<div class="widget-main padding-16">
									<!-- add request_content here -->
								</div>
							</div>
						</div>
					</div>

					<!-- ----------------------- table -->

					<div class="row">
						<div class="col-xs-12">
							<table id="simple-table"
								class="table  table-bordered table-hover">
								<thead>
									<tr>
										<th>Domain</th>
										<th>Price</th>
										<th class="hidden-480">Clicks</th>

										<th><i
											class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
											Update</th>
										<th class="hidden-480">Status</th>

										<th> Actions </th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><a href="#">ace.com</a></td>
										<td>$45</td>
										<td class="hidden-480">3,330</td>
										<td>Feb 12</td>

										<td class="hidden-480"><span
											class="label label-sm label-warning">Expiring</span></td>

										<td>
											<div class="hidden-sm hidden-xs btn-group">
												<button class="btn btn-xs btn-success">
													<i class="ace-icon fa fa-check bigger-120"></i>
												</button>

												<button class="btn btn-xs btn-info">
													<i class="ace-icon fa fa-pencil bigger-120"></i>
												</button>

												<button class="btn btn-xs btn-danger">
													<i class="ace-icon fa fa-trash-o bigger-120"></i>
												</button>

												<button class="btn btn-xs btn-warning">
													<i class="ace-icon fa fa-flag bigger-120"></i>
												</button>
											</div>

											<div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button class="btn btn-minier btn-primary dropdown-toggle"
														data-toggle="dropdown" data-position="auto">
														<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
													</button>

													<ul
														class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
														<li><a href="#" class="tooltip-info"
															data-rel="tooltip" title="" data-original-title="View">
																<span class="blue"> <i
																	class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a></li>

														<li><a href="#" class="tooltip-success"
															data-rel="tooltip" title="" data-original-title="Edit">
																<span class="green"> <i
																	class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a></li>

														<li><a href="#" class="tooltip-error"
															data-rel="tooltip" title="" data-original-title="Delete">
																<span class="red"> <i
																	class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a></li>
													</ul>
												</div>
											</div>
										</td>
									</tr>

									<tr class="detail-row">
										<td colspan="8">
											<div class="table-detail">
												<div class="row">
													<div class="col-xs-12 col-sm-2">
														<div class="text-center">
															<img height="150"
																class="thumbnail inline no-margin-bottom"
																alt="Domain Owner's Avatar"
																src="assets/images/avatars/profile-pic.jpg"> <br>
															<div
																class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
																<div class="inline position-relative">
																	<a class="user-title-label" href="#"> <i
																		class="ace-icon fa fa-circle light-green"></i> &nbsp;
																		<span class="white">Alex M. Doe</span>
																	</a>
																</div>
															</div>
														</div>
													</div>

													<div class="col-xs-12 col-sm-7">
														<div class="space visible-xs"></div>

														<div class="profile-user-info profile-user-info-striped">
															<div class="profile-info-row">
																<div class="profile-info-name">Username</div>

																<div class="profile-info-value">
																	<span>alexdoe</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Location</div>

																<div class="profile-info-value">
																	<i class="fa fa-map-marker light-orange bigger-110"></i>
																	<span>Netherlands, Amsterdam</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Age</div>

																<div class="profile-info-value">
																	<span>38</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Joined</div>

																<div class="profile-info-value">
																	<span>2010/06/20</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Last Online</div>

																<div class="profile-info-value">
																	<span>3 hours ago</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">About Me</div>

																<div class="profile-info-value">
																	<span>Bio</span>
																</div>
															</div>
														</div>
													</div>

													<div class="col-xs-12 col-sm-3">
														<div class="space visible-xs"></div>
														<h4 class="header blue lighter less-margin">Send a
															message to Alex</h4>

														<div class="space-6"></div>

														<form>
															<fieldset>
																<textarea class="width-100" resize="none"
																	placeholder="Type something…"></textarea>
															</fieldset>

															<div class="hr hr-dotted"></div>

															<div class="clearfix">
																<label class="pull-left"> <input type="checkbox"
																	class="ace"> <span class="lbl"> Email me
																		a copy</span>
																</label>

																<button
																	class="pull-right btn btn-sm btn-primary btn-white btn-round"
																	type="button">
																	Submit <i
																		class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
																</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- /.span -->
					</div>

					<!-- -----------------------/ table -->


					<!-- -------------------------/ request table -->

				</div>

				<div style="visibility: hidden;">
					<!-- this page include the action message but it is high in class ajaxUserPage.js -->
					<%@ include
						file="../../../authentication/action/action_message/action_message.jsp"%>
					<%@ include
						file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
				</div>

				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- footer -->
		<%@ include file="../includs/new_footer/new_footer.jsp"%>
	</div>
	<!-- /.page-content -->

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>