<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<h2>사칙연산 결과</h2>
${param.num1 } + ${param.num2 } = ${param.num1 + param.num2 }<p>
${param.num1 } - ${param.num2 } = ${param.num1 - param.num2 }<p>
${param.num1 } * ${param.num2 } = ${param.num1 * param.num2 }<p>
${param.num1 } / ${param.num2 } = ${param.num1 / param.num2 }<p>
</body>
</html>