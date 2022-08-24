<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	// 이 프로그램은 정상이다
	response.setStatus(200);
%>
불편을 드려서 죄송합니다<p>
더 좋은 서비스를 위하여 업그레드 중입니다<p>
<!-- isErrorPage="true"가 있어야 exception 객체를 사용할 수 있다 -->
에러 메세지 <%=exception.getMessage() %>
<!-- ie 에러메세지의길이가 512보다 작으면 자체 에러 메세지를 보여주고
     512byte보다 크면 개발자의 에러 메세지를 보여준다 -->
</body>
</html>