<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<jsp:useBean id="product" class="ch06.Clothing" scope="request"></jsp:useBean>
<jsp:setProperty property="code" name="product" value="c01"/>
<jsp:setProperty property="name" name="product" value="원피스"/>
<jsp:setProperty property="price" name="product" value="20000"/>
<jsp:setProperty property="size" name="product" value="66"/>
<jsp:setProperty property="color" name="product" value="빨강"/>

<jsp:forward page="product_result.jsp"></jsp:forward>
</body>
</html>