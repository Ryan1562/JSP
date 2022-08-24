<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag  body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- rtexprvalue return + EL + value : 값을 반환할 때 EL형식으로 사용 안함 -->
<%@ attribute name="var" required="true" rtexprvalue="false" %>
<%@ attribute name="num1" required="true" type="java.lang.Integer" %>
<%@ attribute name="num2" required="true" type="java.lang.Integer" %>
<!-- AT_END : 마지막에 반환 것을 처리 -->
<!-- 최대값을 maximum대신에 임의로 정한 것을 사용 -->
<%@ variable name-from-attribute="var" alias="maximum" variable-class="java.lang.Integer" 
	scope="AT_END" %>
<%  // 두개의 숫자를 비교해서 큰수를 result에 넣어라
	int result = 0;
	if (num1 > num2) result = num1;
	else result = num2;
%>
<c:set var="maximum" value="<%=result %>"></c:set>