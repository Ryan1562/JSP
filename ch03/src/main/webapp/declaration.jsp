<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- declaration : 지시부 -->
<%	// 변수는 지역변수
	String msg = nation + " 파이팅";
%>
<%=msg %>
<%-- <%! 지시부 declaration --%>
<%! // 여기서는 사용하는 변수는 멤버(전역)변수
    // 메서드를 사용
	String nation = "대한민국";
%>
</body>
</html>