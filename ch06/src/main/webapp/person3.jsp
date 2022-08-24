<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>

<jsp:useBean id="person" class="ch06.Person" scope="request"></jsp:useBean>
<!--모든 속성에 parameter로 넘어온 이름이 같은 데이터를 찾아서 값을 채워라 
	form태그의 name="이름" 과 person객체의 속성 이름이 반드시 일치 -->
<jsp:setProperty property="*" name="person"/>

<jsp:forward page="person_result.jsp"></jsp:forward>
</body>
</html>