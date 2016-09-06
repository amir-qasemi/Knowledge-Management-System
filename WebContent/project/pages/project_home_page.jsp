<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project</title>

<!-- CSS includes files -->
<%@ include file="../includs/templates/css_include_files.jsp"%>

</head>
<body class="no-skin">

	<div id="wrapper">
		<!-- including navigation bar -->
		<%@ include file="../includs/nave_bar/project_nav_bar.jsp"%>

		<div class="main-container ace-save-state" id="main-container">


			<div class="col col-xs-4">

				<!-- include side bar -->
				<%@ include file="../includs/side_bar/project_side_bar.jsp"%>

			</div>

			<div class="main-content">
				<div class="main-content-inner">

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<!-- heading -->
								<div class="page-header">
									<h1>Project</h1>
								</div>

								<!-- ----------------------- project body -->

								<div class="col-sm-12">
									<div class="tabbable">
										<ul class="nav nav-tabs" id="myTab">
											<li class="active"><a data-toggle="tab" href="#home">
													<i class="green ace-icon fa fa-home bigger-120"></i> Home
											</a></li>
										</ul>

										<div class="tab-content">
											<div id="home" class="tab-pane fade in active">

												<!-- heading -->
												<div class="page-header">
													<h1>Create new project</h1>
												</div>

												<div class="widget-box widget-color-blue">
													<div class="widget-header">
														<h5 class="widget-title bigger lighter">Define new
															project</h5>
													</div>

													<div class="widget-body">
														<div class="widget-main">
															<ul class="list-unstyled spaced2">
																<li>content : you can define your project here and
																	add your partners !</li>
																<li><a href="defineNewProjectRedirecr"
																	class="btn btn-block btn-primary"> <span>Create</span>
																</a></li>
															</ul>
														</div>
													</div>
												</div>

												<!-- --------------------------- your project body -->

												<br>
												<hr>

												<div class="widget-box transparent">
													<div class="widget-header widget-header-large">
														<h3 class="widget-title grey lighter">
															<i class="ace-icon fa fa-leaf green"></i> your project
														</h3>

														<div class="widget-toolbar no-border invoice-info">
															<span class="invoice-info-label">Date:</span> <span
																class="blue"> <%
 	out.print(new Date().toString());
 %>
															</span>
														</div>

													</div>

													<div class="widget-body">
														<div class="widget-main padding-24">
															<div class="row">
																<div class="col-sm-6">
																	<div class="row">
																		<div
																			class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
																			<b>Your projects</b>
																		</div>
																	</div>

																	<div>
																		<ul class="list-unstyled spaced">
																			<li><i class="ace-icon fa fa-caret-right blue"></i><a>
																					your projects show here ! </a></li>
																		</ul>
																	</div>
																</div>
																<!-- /.col -->

																<div class="col-sm-6">
																	<div class="row">
																		<div
																			class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
																			<b>Received request for colleague</b>
																		</div>
																	</div>

																	<div>
																		<ul class="list-unstyled  spaced">
																			<li><i class="ace-icon fa fa-caret-right green"></i>show
																				request here !</li>
																		</ul>
																	</div>
																</div>
																<!-- /.col -->
															</div>
															<!-- /.row -->
														</div>
													</div>
												</div>

												<!-- ----------------------------/ your project body -->


											</div>

										</div>
									</div>
								</div>

								<!-- ------------------------/ project body -->
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
						<%@ include
							file="../../../dashboard/admin/includs/new_footer/new_footer.jsp"%>
					</div>
					<!-- /.page-content -->
				</div>
			</div>

		</div>
	</div>


	<!-- JS includes files -->
	<%@ include file="../includs/templates/js_include_files.jsp"%>

	<!-- ad AJAX for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>

</body>
</html>