<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="robots" content="nosnippet" />
<meta name="robots" content="noindex">
<link rel="shortcut icon" href="${path}/resources/images/favicon.ico">


<!-- CSS -->

<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${path}/resources/css/style.css" rel="stylesheet"/>
<link href="${path}/resources/css/responsive.css" rel="stylesheet"/>
<link href="${path}/resources/css/custom.css" rel="stylesheet"/>
<link href="${path}/resources/css/pignose.calendar.min.css" rel="stylesheet"/>

<!-- JS -->
<script src="${path}/resources/js/jquery-3.2.1.min.js"></script>
<script language="javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="${path}/resources/js/pignose.calendar.full.min.js"></script>

<title>개발자 안혁</title>
</head>
<body>
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
	


<!-- ALL JS FILES -->
<script src="${path}/resources/js/popper.min.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="${path}/resources/js/jquery.superslides.min.js"></script>
<script src="${path}/resources/js/bootstrap-select.js"></script>
<script src="${path}/resources/js/inewsticker.js"></script>
<script src="${path}/resources/js/bootsnav.js"></script>
<script src="${path}/resources/js/images-loded.min.js"></script>
<script src="${path}/resources/js/isotope.min.js"></script>
<script src="${path}/resources/js/owl.carousel.min.js"></script>
<script src="${path}/resources/js/baguetteBox.min.js"></script>
<script src="${path}/resources/js/form-validator.min.js"></script>
<script src="${path}/resources/js/contact-form-script.js"></script>
<script src="${path}/resources/js/custom.js"></script>

</body>
</html>