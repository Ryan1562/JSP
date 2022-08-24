<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch06.Person"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- Person person = new Person(); -->
<jsp:useBean id="person" class="ch06.Person" scope="request"></jsp:useBean>
<!-- person.setName("하니"); -->
<jsp:setProperty property="name" name="person" value="하니"/>
<jsp:setProperty property="age" name="person" value="32"/>
<jsp:setProperty property="gender" name="person" value="여자"/>

<jsp:forward page="person_result.jsp"></jsp:forward>
</body>
</html>