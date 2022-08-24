<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head><body>
<h2>누계할 숫자 입력</h2>
<form action="sum_result.jsp">
<table>
	<tr><th>숫자</th><td><input type="number" name="num" autofocus="autofocus"
		required="required"></td></tr>
	<tr><th colspan="2"><input type="submit"></th></tr>
</table>
</form>
</body>
</html>