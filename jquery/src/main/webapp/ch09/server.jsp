<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head><body>
<div data-role="page">
	<div data-role="header"><h1>처리 결과</h1></div>
	<div data-role="content">
		이름 : <%=request.getParameter("name") %><p>
		주소 : <%=request.getParameter("addr") %>
	</div>
	<div data-role="footer" data-position="fixed">
		<div data-role="navbar">
			<ul><li><a href="http://m.google.com" data-icon="grid" class="ui-btn-active">구글</a></li>
				<li><a href="http://m.daum.net" data-icon="star">다음</a></li>
				<li><a href="http://m.naver.com" data-icon="home">네이버</a></li></ul>
		</div>	
	</div>
</div>
</body>
</html>