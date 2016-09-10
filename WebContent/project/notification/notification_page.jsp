<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
</head>
<body>

	<button onclick="notifyMe()">Notify me!</button>

	<script type="text/javascript">
		function notifyMe() {
			// Let's check if the browser supports notifications
			if (!("Notification" in window)) {
				alert("This browser does not support desktop notification");
			}

			// Let's check whether notification permissions have already been granted
			else if (Notification.permission === "granted") {
				// If it's okay let's create a notification
				var notification = new Notification("It's a test for KMS page!");
			}

			// Otherwise, we need to ask the user for permission
			else if (Notification.permission !== 'denied') {
				Notification.requestPermission(function(permission) {
					// If the user accepts, let's create a notification
					if (permission === "granted") {
						var notification = new Notification("Hi there!");
					}
				});
			}

			// At last, if the user has denied notifications, and you 
			// want to be respectful there is no need to bother them any more.
		}
	</script>
</body>
</html>