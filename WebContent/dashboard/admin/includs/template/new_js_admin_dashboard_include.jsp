<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!-- basic scripts -->

<!--[if !IE]> -->
<script src="templates/assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)
		document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
				+ "<"+"/script>");

	// ok this area provided to control the statment for allert
	$(".display")
			.on(
					"click",
					function() {
						$(".idLabel").val(
								$(this).parent().parent().siblings(".id")
										.html());
						$(".userNameLabel").val(
								$(this).parent().parent().siblings(".userName")
										.html());
						$(".emailLabel").val(
								$(this).parent().parent().siblings(".email")
										.html());
						$(".messageLabel").val(
								$(this).parent().parent().siblings(".content")
										.html());
						$(".alert").click();
						$(".dateLabel").val(
								$(this).parent().parent().siblings(".date")
										.html());
					});
	//---------------------------/alert...
</script>
<script src="templates/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script src="templates/assets/js/ace-elements.min.js"></script>
<script src="templates/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
