<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%  // 자바코드 시작, scriptlet
	int sum = 0;
	for (int i =1; i<= 100; i++) {
		sum += i;
	}
// 자바코드 끝 %>
<%-- <%=sum %> : 이것을 expression 표현식으로 부르고 변수의 값을 html로 전달 --%>
1부터 100까지 합 : <%=sum %>
</body>
</html>