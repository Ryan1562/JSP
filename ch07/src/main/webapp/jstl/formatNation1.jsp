<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<!-- ko : 한국어 언어코드, kr : 한국 국가코드  인터넷으로 검색
	 en : 영어          us : 미국         
	 ja : 일본어        jp : 일본
-->
<h2>우리나라</h2>
<fmt:setLocale value="ko_kr"/>
금액 : <fmt:formatNumber value="1000000" type="currency"></fmt:formatNumber><br>
날자 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/>
<h2>미국</h2>
<fmt:setLocale value="en_us"/>
금액 : <fmt:formatNumber value="1000000" type="currency"></fmt:formatNumber><br>
날자 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/>
<h2>일본</h2>
<fmt:setLocale value="ja_jp"/>
금액 : <fmt:formatNumber value="1000000" type="currency"></fmt:formatNumber><br>
날자 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/>
</body>
</html>