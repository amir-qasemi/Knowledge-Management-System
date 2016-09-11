
<label> <input type="hidden" id="captchaResult"
	name="captchaResult">
</label>
<label> <input type="hidden" id="numberOfImage"
	name="numberOfImage" value="1">
</label>

<table border="0" cellpadding="5" cellspacing="0" width="600">
	<tr>
		<td colspan="2" align="center"><br />
			<table border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td><i style="margin-left: -200px">Enter the security
							code:</i> <input id="CaptchaCode" name="skip_CaptchaCode" type="text"
						style="width: 80px; margin-left: 0px; border: 1px solid #999999"
						maxlength="9" /></td>
					<td><img id="CaptchaImage" alt="contact email form"
						title="contact email form"
						style="margin-left: -20px; border: 1px solid #999999"
						src="authentication/captchaImages/1.png" /> <br /> <a href="#"
						onclick="return ReloadCaptchaImage();"><span
							style="font-size: 12px; margin-left: 0px;">reload image</span></a></td>
				</tr>

			</table>
	</tr>
</table>
