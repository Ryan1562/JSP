<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>당첨 결과</h2>
1등 : ${winners[0] } - 냉장고를 싸는 박스<p>
2등 : ${winners[1] } - TV를 묶는 끈<p>
3등 : ${winners[2] } - 라면 한박스<p>
<h2>당첨 결과</h2>
<%	String[] sangpum = {"냉장고를 싸는 박스","TV를 묶는 끈","라면 한박스"};
	String[] winners = (String[])request.getAttribute("winners");
	for (int i = 0; i <winners.length; i++) {
		out.println((i+1)+"등 : "+winners[i]+" - "+sangpum[i]+"<p>");
	}
%>
</body>
</html>