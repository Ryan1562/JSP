<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<h2>두문자 비교</h2>
첫번째 문자 : ${param.t1 }<p>
두번째 문자 : ${param.t2 }<p>
큰 문자 : ${param.t1 > param.t2?param.t1:param.t2 }
</body>
</html>