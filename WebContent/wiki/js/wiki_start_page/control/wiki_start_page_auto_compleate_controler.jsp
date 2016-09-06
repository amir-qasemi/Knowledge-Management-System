<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
	$(function() {

		$("#createWiki").on("click", function() {
			$("#createWikiRedirectSubmit").click();
		});

		$('#hero-demo').autoComplete({
			minChars : 1,
			source : function(term, suggest) {
				term = term.toLowerCase();
				var choices = [];
				choices = document.getElementById("list").value.toString();
				var suggestions = [];
				for (i = 0; i < choices.length; i++)
					if (~choices[i].toLowerCase().indexOf(term))
						suggestions.push(choices[i]);
				suggest(suggestions);
			}
		});
	});

	if (~window.location.href.indexOf('http')) {
		(function() {
			var po = document.createElement('script');
			po.type = 'text/javascript';
			po.async = true;
			po.src = 'https://apis.google.com/js/plusone.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(po, s);
		})();
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=114593902037957";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
					.test(d.location) ? 'http' : 'https';
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = p + '://platform.twitter.com/widgets.js';
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, 'script', 'twitter-wjs');
		$('#github_social')
				.html(
						'\
                <iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-autoComplete&type=watch&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
                <iframe style="float:left;margin-right:15px" src="//ghbtns.com/github-btn.html?user=Pixabay&repo=jQuery-autoComplete&type=fork&count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>\
            ');
	}

	
</script>