<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${path}/resources/images/favicon.ico">

<!-- JS -->
<script src="${path}/resources/js/jquery.min.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/printThis.js"></script>
<script language="javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${path}/resources/css/reset.css" rel="stylesheet"/>
<link href="${path}/resources/css/custom.css" rel="stylesheet"/>


<title>개발자 안혁</title>
</head>
<body class="body-main body-index pc">
	<div id="wrap">
		<div id="header_warp">
			<tiles:insertAttribute name="header" />
			<div class="dim_layer" style="display:  none"></div>
		</div>
		<div id="content" style="min-height:653px;">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="footer_wrap">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	
<script>
	$(function(){//사이드바 고정
		var nav = $('#scroll_right');
		$(window).scroll(function () {
			if ($(this).scrollTop() > 490) {
				nav.addClass("fixed");
			} else {
				nav.removeClass("fixed");
			}
		});
	});
	
</script>

</body>
</html>