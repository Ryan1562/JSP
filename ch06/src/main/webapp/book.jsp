<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>책 소개</h2>
제목 : 대지<p>
작자 : 펄벅<p>
내용 : 왕룽일가 이야기<p>
<!-- 액션태그는 실행 결과를 가져온다 동적
	 include지시자는 소스를 가지고 와서 같이 컴파일 한다 정적 -->
<jsp:include page="copy.jsp"></jsp:include><br>
<jsp:include page="test/date.jsp"></jsp:include>
<!-- include지시자를 사용할 때는 소스에 있는 변수를 사용할 수 있다  -->
<%@ include file="test/date.jsp" %>
현재 : <%=date %>
</body>
</html>