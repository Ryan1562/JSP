<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<jsp:useBean id="person" class="ch06.Person" scope="request"></jsp:useBean>
<!-- param="name" form에 parameter로 이름이 name에 담겨온 값 -->
<jsp:setProperty property="name" name="person" param="name"/>
<jsp:setProperty property="age" name="person" param="age"/>
<jsp:setProperty property="gender" name="person" param="gender"/>

<jsp:forward page="person_result.jsp"></jsp:forward>
</body>
</html>