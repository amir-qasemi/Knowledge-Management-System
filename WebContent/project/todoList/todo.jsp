<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--This part is for adding CSS to the page//-->
<style type="text/css">
	<%@ include file="todo_css.css"%>
</style>


</head>
<body>

	
	<div id="myDIV" class="header">
		<h2>My To Do List</h2>
		<input type="text" id="myInput" placeholder="Title..."> <span
			onclick="newElement()" class="addBtn">Add</span>
	</div>

	<ul id="myUL">
	</ul>
	
	<!--This part is for adding script methods to the page//-->
	<%@ include file="todo_script.jsp"%>
	
	
	<div class="alert alert-danger" id = "mydiv">
		<strong>Danger!</strong> This is an empty action.
	</div>
	<script type="text/javascript">
		var isSet = false;
		setTimeout(function() {
			$('#mydiv').fadeOut('fast');
			isSet = false;
		}, 5000);
	</script>
	
	

</body>
</html>