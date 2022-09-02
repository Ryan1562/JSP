<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch16.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body>
<%
	DeptDao dd = DeptDao.getInstance();
	List<Dept> list = dd.list();
	pageContext.setAttribute("list", list);
%>
<!-- <form action="EmpInfo"> -->
<!-- <form action="EmpXml"> -->
<form action="EmpJson">
<table><caption>부서 선택</caption>
	<tr><td><select name="deptno">
		<option value="0">전체(0)</option>
		<c:forEach var="dept" items="${list }">
			<option value="${dept.deptno }">${dept.dname }(${dept.deptno })</option>
		</c:forEach>
		</select></td></tr>
	<tr><td><input type="submit"></td></tr>	
</table>
</form>
</body>
</html>