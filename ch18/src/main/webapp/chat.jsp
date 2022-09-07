<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">                                         /* 테이블 크기 조정         넘치면 숨김  */  
	table { height: 450px; border: 2px solid green; width: 90%; table-layout: fixed; overflow: hidden; }
	div { height: 400px; overflow: scroll; width: 90%; border: 2px solid green; }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var websocket = new WebSocket("ws://172.30.1.27:8080/ch18/websocket");
	var disp;  // 여러 function에서 같이 사용하려는 뜻, 전역 변수
	websocket.onopen = function() {  // 처음 연결
		disp = document.getElementById("disp");
		disp.innerHTML += "연결 되었습니다<br>";
	}
	websocket.onclose = function() {  // 채팅을 종료하거나 사용 화면을 끄면
		disp.innerHTML += "종료 되었습니다<br>";
	}
	websocket.onerror = function() {  // 에러가 발생하면
		disp.innerHTML += "어이쿠 !! 에러<br>";
	}
	websocket.onmessage = function(event) {  // 메세지가 오면
		disp.innerHTML += event.data+"<br>";
		// scrollbar를 움직여서 최신 메세지가 보이도록 설정
		var objDiv = document.getElementById("disp");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	function webstart() {
		var message = document.getElementById("content").value;
		var name = document.getElementById("name").value;
		websocket.send(name+" > "+ message);
		document.getElementById("content").value = "";
	}
	function init() {
		content = document.getElementById("content");
		content.addEventListener("keyup", function(event) {  // 키보드를 사용하여 글자를 입력하면
		//  누른 키값                       IE           나머지	
			var keycode = event.keyCode?event.keyCode:event.which;
			if (keycode == 13) webstart();   // 아스키코드 13은 enter
			event.stopPropagation();   // 이벤트 전달 금지
		});
	}
	/* onload 화면이 출력괴고 바로 실행 유사한 것 window.onload = function() */
</script></head><body onload="init()">
별명 : <input type="text" name="name" id="name">
<table border="1">
	<tr><th height="400" id="a"><div id="disp"></div></th></tr>
	<tr><td height="50"><input type="text" id="content"><br>
		<button onclick="webstart()">웹 채팅</button></td></tr>
</table>
</body>
</html>