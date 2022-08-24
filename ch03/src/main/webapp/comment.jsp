<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	//  나도 주석   소스 보기로 보루 없음
	/*   주석 시작
		주석 범위
	*/
	String name = "제니";
	int age = 25;
	
%>
<!-- html주석 시작  주석    html주석 끝 소스보기로 볼 수 있음 -->
<%=name %>
<%-- <%=age %> 소스 보기로 볼 수 없음--%>
<!-- <%-- jsp주석 시작 --%> jsp 주석 종료 -->
<!-- <%=age %> expression이 실행된 결과가 소스 보기에 보인다 -->
</body>
</html>