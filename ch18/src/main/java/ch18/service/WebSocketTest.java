package ch18.service;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
// 웹 소켓 클래스를 만들고 호출하기 위한 주소를 설정하는 어노테이션
@ServerEndpoint("/websocket")
public class WebSocketTest {
//	클라이언트롤 연결된 사람들 session저장
	private static final Set<Session> clients = new HashSet<>();
	private Session session;
	@OnOpen // 웹 소켓으로 연결하면
	public void open(Session session) {
		this.session = session;
		clients.add(session);
		String message = "connect";
		broadcast(message);
	}
	private void broadcast(String message) {
		for (Session client : clients) { // 연결된 모두에게 메세지 전달
			try {
				client.getBasicRemote().sendText(message);
			} catch (IOException e) { clients.remove(client);  // 채팅을 끊은 것으로 보고 제거
				try { client.close();
				} catch (IOException e1) {	}
				message = "close";   // 채팅 종료했다는 메세지를 전달
				broadcast(message);
			}
		}
	}
	@OnMessage  // 메세지가 도착하면
	public void onmessage(String message) {
		// 메세지 내용이 없으면 이 메서드 종료
		if (message == null || message.equals("")) return;
		else broadcast(message);
	}
	@OnClose // 채팅을 종료하면
	public void close() {
		clients.remove(session); // 종료한 사람의 session을 제거
		String message = "disconnect";
		broadcast(message);
	}
	@OnError // 에러가 발생하면
	public void err(Throwable t) {
		System.out.println(t.getMessage());  // 에러 메세지를 몬솔에 출력
	}
}