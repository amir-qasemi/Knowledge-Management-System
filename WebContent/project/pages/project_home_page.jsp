<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project</title>
<link rel="icon" type="image/jpg" href="images/title.jpg">

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
																	<br />

																	<div class="col col-xs-6">


																		<div class="widget-box widget-color-green">
																			<div class="widget-header widget-header-small">
																				<h5 class="widget-title smaller">
																					<i class="fa fa-unlock"></i>&nbsp;Public projects
																				</h5>
																			</div>
																		</div>


																	</div>


																	<div class="col col-xs-6">


																		<div class="widget-box widget-color-red">
																			<div class="widget-header widget-header-small">
																				<h5 class="widget-title smaller">
																					<i class="fa fa-lock"></i>&nbsp;Private projects
																				</h5>
																			</div>
																		</div>


																	</div>

																	<div class="col-xs-12">
																		<div class="timeline-container">

																			<div class="timeline-label">
																				<span
																					class="label label-primary arrowed-in-right label-lg">
																					<b>Projects</b>
																				</span>
																			</div>

																			<!-- all of the content write in iterator -->

																			<s:iterator status="stat" value="projectNames">
																				<form>

																					<div style="visibility: hidden;">
																						<input type="text"
																							value='<s:property value="project_id" />'>
																					</div>

																					<s:if test="%{project_access_level=='public'}">
																						<div class="timeline-items">

																							<div class="timeline-item clearfix">
																								<div class="timeline-info">
																									<i
																										class="timeline-indicator ace-icon fa fa-unlock btn btn-success no-hover"></i>
																								</div>

																								<div class="widget-box widget-color-green">
																									<div class="widget-header widget-header-small">
																										<h5 class="widget-title smaller">creator
																											user name here</h5>

																										<span class="widget-toolbar no-border">
																											<i class="ace-icon fa fa-clock-o bigger-110"></i>
																											creation date here
																										</span> <span class="widget-toolbar"> <a
																											href="#" data-action="collapse"> <i
																												class="ace-icon fa fa-chevron-up"></i>
																										</a>
																										</span>
																									</div>

																									<div class="widget-body">
																										<div class="widget-main">
																											Project id :
																											<s:property value="project_id" />
																											<br /> Project name :
																											<s:property value="project_name" />
																											<br /> Project description :
																											<s:property value="project_description" />
																										</div>
																										<div class="pull-right">
																											<button type="submit" class="btn btn-success"><i class="fa fa-unlock"></i>&nbsp;Open</button>
																										</div>
																									</div>
																								</div>
																							</div>
																						</div>
																					</s:if>
																					<s:else>
																						<div class="timeline-items">

																							<div class="timeline-item clearfix">
																								<div class="timeline-info">
																									<i
																										class="timeline-indicator ace-icon fa fa-lock btn btn-danger no-hover"></i>
																								</div>

																								<div class="widget-box widget-color-red">
																									<div class="widget-header widget-header-small">
																										<h5 class="widget-title smaller">creator
																											user name here</h5>

																										<span class="widget-toolbar no-border">
																											<i class="ace-icon fa fa-clock-o bigger-110"></i>
																											creation date here
																										</span> <span class="widget-toolbar"> <a
																											href="#" data-action="collapse"> <i
																												class="ace-icon fa fa-chevron-up"></i>
																										</a>
																										</span>
																									</div>

																									<div class="widget-body">
																										<div class="widget-main">
																											Project id :
																											<s:property value="project_id" />
																											<br /> Project name :
																											<s:property value="project_name" />
																											<br /> Project description :
																											<s:property value="project_description" />
																										</div>
																										<div class="pull-right">
																											<button type="submit" class="btn btn-danger"><i class="fa fa-unlock"></i>&nbsp;Open</button>
																										</div>
																									</div>
																								</div>
																							</div>
																						</div>
																					</s:else>

																				</form>
																				<!-- /.timeline-items -->
																			</s:iterator>
																		</div>
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

	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
</body>
</html>