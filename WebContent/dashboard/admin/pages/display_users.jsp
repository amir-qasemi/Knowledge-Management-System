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

							<!-- --------------------------------- users list ------------- -->
							<!-- heading -->
							<div class="page-header">
								<h1>Users list</h1>
							</div>

							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>LastName</th>
											<th>Email</th>
											<th>UserName</th>
											<th>Action</th>
										</tr>
									</thead>

									<tbody>

										<s:iterator status="stat" value="users">
											<tr class="list">
												<td class="name"><s:property value="firstName" /></td>
												<td class="lastName"><s:property value="lastName" /></td>
												<td class="email"><s:property value="email" /></td>
												<td class="userName"><s:property value="userName" /></td>
												<td class="Action"><button type="button"
														class="btn btn-xs btn-info editButtons">
														<i class="ace-icon fa fa-pencil bigger-120"></i>
													</button> <s:if test="%{banned==false}">
														<button type="button"
															class="btn btn-xs btn-warning unbanButton">
															<i class="ace-icon fa fa-flag bigger-120"></i>
														</button>
													</s:if> <s:elseif test="%{banned==true}">
														<button type="button"
															class="btn btn-xs btn-danger banButton">
															<i class="ace-icon fa fa-flag bigger-120"></i>
														</button>
													</s:elseif></td>
											</tr>
										</s:iterator>

									</tbody>
								</table>
								<!-- ---------------------------------/ users list ------------- -->

								<!-- ----------------------- register panel --------------------------------------- -->

								<br />
								<!-- heading -->
								<div class="page-header">
									<h1>Register new user</h1>
								</div>

								<div class="col-lg-12">
									<div class="widget-box widget-color-red">
										<div class="widget-header panel-heading">Register new
											user</div>
										<div class="widget-body panel-body">
											<p>this section provided for you to registering user on
												Knowledge management system</p>
										</div>
										<div class="panel-footer">

											<form action="signupRedirectAction" method="post">
												<button type="submit" class="btn btn-danger btn-outline">
													Register user <i
														class="glyphicon glyphicon-registration-mark"></i>
												</button>
											</form>

										</div>
									</div>
								</div>

								<!-- ------------------------------------/ register panel -------------------------- -->

								<div class="col-lg-12" style="visibility: hidden;">
									<form action="editRedirect" method="post">
										<div class="tab-content">
											<div class="col col-xs-6">
												<div class="tab-pane fade in active" id="home-pills">
													<input name="userName" type="text"
														class="form-control userNames" required autofocus>
													<br /> <input type="submit" value="edit"
														class="btn btn-outline btn-danger EditeSubmit">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
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

	<div style="visibility: hidden;">
		<!-- this page include the action message but it is high in class ajaxUserPage.js -->
		<%@ include
			file="../../../authentication/action/action_message/action_message.jsp"%>
		<%@ include
			file="../../../authentication/signout/ajax/ajax_sign_out_action_message/ajax_sign_out_error_message.jsp"%>
	</div>

	<div class="">
		<!-- Trigger the modal with a button -->
		<a href="#" id="modalTrigger" data-toggle="modal"
			data-target="#removeModal"></a>

		<!-- Modal -->
		<div id="removeModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close closeTheModal"
							data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Ban Result :</h4>
					</div>
					<div class="modal-body">
						<p id="modalBody"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default closeTheModal"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- this JS file control the user page actions -->
	<%@ include
		file="../includs/template/new_js_admin_dashboard_include.jsp"%>

	<script src="dashboard/admin/js/admin_page_control/control.js"></script>

	<!-- this AJAX request for ban our unban the users -->
	<script src="dashboard/admin/ajax/ajax_request_for_edit/ajax_edit.js"></script>

	<!-- this AJAX request for sign out -->
	<script
		src="authentication/signout/ajax/ajax_request_for_sign_out/ajax_sign_out.js"></script>
</body>
</html>