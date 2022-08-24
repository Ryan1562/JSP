<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- Product product = new Book(); -->
<jsp:useBean id="product" class="ch06.Book" scope="request"></jsp:useBean>
<jsp:setProperty property="code" name="product" value="b01"/>
<jsp:setProperty property="name" name="product" value="누구를 위하여 종을 울리나"/>
<jsp:setProperty property="price" name="product" value="20000"/>
<jsp:setProperty property="page" name="product" value="2000"/>
<jsp:setProperty property="writer" name="product" value="하밍웨이"/>

<!-- 사용할 수 있는 메서드는 부모에 있는 메서드만 사용 가능 -->
<jsp:forward page="product_result.jsp"></jsp:forward>
</body>
</html>