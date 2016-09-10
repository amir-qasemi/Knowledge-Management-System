<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">

</head>
<body>
	<form action="http://www.SnapHost.com/captcha/send.aspx"
		id="ContactUsCaptchaWebForm" method="post"
		onsubmit="return ValidateForm(this);">
		<input id="skip_WhereToSend" name="skip_WhereToSend" type="hidden"
			value="your@email.com" /> <input id="skip_SnapHostID"
			name="skip_SnapHostID" type="hidden" value="7TLZJX5ZJAP3" /> <input
			id="skip_WhereToReturn" name="skip_WhereToReturn" type="hidden"
			value="http://www.YourWebsiteAddress.com/ThankYouPage.htm" /> <input
			id="skip_Subject" name="skip_Subject" type="hidden"
			value="Sign Up Web Form" /> <input id="skip_ShowUsersIp"
			name="skip_ShowUsersIp" type="hidden" value="1" /> <input
			id="skip_SendCopyToUser" name="skip_SendCopyToUser" type="hidden"
			value="1" />
		<script type="text/javascript">
			function ValidateForm(frm) {
				if (frm.skip_CaptchaCode.value == "") {
					alert('Enter the security code.');
					frm.skip_CaptchaCode.focus();
					return false;
				}
				return true;
			}
			function ReloadCaptchaImage(captchaImageId) {
				var obj = document.getElementById(captchaImageId);
				var src = obj.src;
				var date = new Date();
				var pos = src.indexOf('&rad=');
				if (pos >= 0) {
					src = src.substr(0, pos);
				}
				obj.src = src + '&rad=' + date.getTime();
				return false;
			}
		</script>
		<table border="0" cellpadding="5" cellspacing="0" width="600">
			<tr>
				<td colspan="2" align="center"><br />
					<table border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">

							<td><a href="http://www.snaphost.com/captcha"><img
									id="CaptchaImage" alt="contact email form"
									title="contact email form"
									style="margin-left: 130px; border: 1px solid #999999"
									src="http://www.SnapHost.com/captcha/CaptchaImage.aspx?id=7TLZJX5ZJAP3&ImgType=2" /></a>
								<br /> <a href="#"
								onclick="return ReloadCaptchaImage('CaptchaImage');"><span
									style="font-size: 12px; margin-left: 170px;">reload image</span></a></td>
						</tr>
						<tr>
							<td><i>Enter the security code:</i> <input
								id="skip_CaptchaCode" name="skip_CaptchaCode" type="text"
								style="width: 80px; border: 1px solid #999999" maxlength="6" />
							</td>
						</tr>
					</table> <br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input style="margin-left: 80px;"
					id="skip_Submit" name="skip_Submit" type="submit" value="Submit" /></td>
			</tr>
		</table>
		<br />
	</form>




</body>
</html>