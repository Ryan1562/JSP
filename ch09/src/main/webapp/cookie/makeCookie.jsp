<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%  //                         속성   값
	Cookie cookie = new Cookie("id", "k1");  // 쿠키 생성
	// 브라우저를 닫으면 쿠키의 사용 종료
	cookie.setMaxAge(60*5);     // 초단위 60*2 = 2분, 쿠키 사용 시간
	// cookie.setMaxAge(0);     // 쿠키 사용종료, 쿠키를 삭제한 효과
	// cookie.setMaxAge(-1);    // 브라우저를 닫으면 쿠키를 종료
	// cookie.setValue("kim");  // 값을 kim으로 변경
	response.addCookie(cookie); // client에 쿠키 저장
%>
<h2>쿠키 생성</h2>
<a href="cookieUse.jsp">쿠키값을 확인</a>
</body>
</html>