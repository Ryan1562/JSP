<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="product" class="ch06.Product" scope="request"></jsp:useBean>
<h2>상품 소개</h2>
코드 : <jsp:getProperty property="code" name="product"/><p>
제품명 : <jsp:getProperty property="name" name="product"/><p>
가격 : <jsp:getProperty property="price" name="product"/><p>
</body>
</html>