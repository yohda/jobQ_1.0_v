package egovframework.example.admin.etc.webSocket;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import egovframework.example.admin.cmmn.utils.JsonUtils;


// 그리고 웹 소켓은 페이지의 이동시 즉, url이 변경되면 새로 생성되 버린다...

// 지금 밑에 경로를 저렇게 둔 이유는 관리자와 사용자 디스패처 서블릿이 달라서 저렇게 정했다.
// 즉, 클라이언트쪽에서 사용하는 디스패처 서블릿이 /admin/*경로에 대해서 받지 않으므로, 어떠한 디스패처 서블릿도 거치지 않게 경로를 정했다.

// JSR-356표준(javax.websocket)을 이용해서 만든 웹 소켓서버.
@ServerEndpoint("/realtime/qna")
public class QnaWebSocketController{
	// 밑에 주석처리된 방식은 예전 방식이다. HashTable은 jdk 1.1부터 나왔는데 동기화를 지원하기 때문에 속도가 느리다.
	// 그래서 jdk 1.2부터는 HashMap을 사용했는데, HashMap은 빠른 대신 동기화를 지원하지 않는다.
	// 그래서 밑에와 같은 방식은 jdk 1.4까지는 사용했다고 한다. 
	// private Map<String, Session> userList = Collections.synchronizedMap(new HashMap<String, Session>());
	private static Map<String, Session> userList = new ConcurrentHashMap<String, Session>();	// 이게 더 빠른 성능을 보장한다.
	
	@OnOpen
	public void handleOpen(Session session){
		System.out.println("오픈");
	}
	
	@OnMessage
	public void handleMessage(String message, Session session){
		System.out.println(message);
		Map<String, String> qnaInfo = JsonUtils.convertFromJson(message, Map.class);
		if(qnaInfo.get("username").equals("adminer") && qnaInfo.get("step").equals("init"))
			userList.put("admin", session);
		/*else if(qnaInfo.get("username").equals("adminer") && qnaInfo.get("step").equals("close")){
			
			userList.remove("admin");
		}*/else{
			
			final Session adminer = userList.get("admin");
			try {
				adminer.getBasicRemote().sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {session.close();} catch (IOException e) {}
			}
		}
	}
	
	@OnClose
	public void handleClose(Session session){
		System.out.println("닫힘");
	}
	
}
