
<form id="ContactUsCaptchaWebForm" method="post"
	onsubmit="return ValidateForm(this);">
	<input id="skip_WhereToSend" name="skip_WhereToSend" type="hidden"
		value="your@email.com" /> <input id="skip_SnapHostID"
		name="skip_SnapHostID" type="hidden" value="7TLZJX5ZJAP3" /> <input
		id="skip_WhereToReturn" name="skip_WhereToReturn" type="hidden" />
	<input id="skip_Subject" name="skip_Subject" type="hidden"
		value="Sign Up Web Form" /> <input id="skip_ShowUsersIp"
		name="skip_ShowUsersIp" type="hidden" value="1" /> <input
		id="skip_SendCopyToUser" name="skip_SendCopyToUser" type="hidden"
		value="1" /> <label> <input type="hidden" id="captchaResult"
		name="captchaResult">
	</label>
	<script type="text/javascript">
		function ValidateForm(frm) {
			if (frm.skip_CaptchaCode.value == "") {
				alert('Enter the security code.');
				frm.skip_CaptchaCode.focus();
				("#captchaResult").value = false;
				return false;
			}
			("#captchaResult").value = true;
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
						<td><i style="margin-left: -200px">Enter the security
								code:</i> <input id="skip_CaptchaCode" name="skip_CaptchaCode"
							type="text"
							style="width: 80px; margin-left: 0px; border: 1px solid #999999"
							maxlength="6" /></td>
						<td><a href="http://www.snaphost.com/captcha"><img
								id="CaptchaImage" alt="contact email form"
								title="contact email form"
								style="margin-left: -20px; border: 1px solid #999999"
								src="http://www.SnapHost.com/captcha/CaptchaImage.aspx?id=7TLZJX5ZJAP3&ImgType=2" /></a>
							<br /> <a href="#"
							onclick="return ReloadCaptchaImage('CaptchaImage');"><span
								style="font-size: 12px; margin-left: 20px;">reload image</span></a></td>
					</tr>

				</table>
		</tr>
	</table>
	<br />
</form>