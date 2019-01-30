/**
 * Web Worker를 이용하여 Web Socket을 별도로 처리한다.
 */

let webSocket = new WebSocket('ws://localhost:80/sample/realtime/qna');
	webSocket.adminInfo = {};
	
	/* Spring Security를 사용할 경우 세션에 접근할 경우 밑에와 같이 접근하는것 좋다. */
	/* Spring Security에서 인증된 사용자 정보는 Principal에 저장되어 있다. */
	webSocket.onopen = function(){
		console.log('2');
		webSocket.adminInfo.step = 'init';
		
		send();
	}
	
	webSocket.onmessage = function(message){
		console.log(message.data);
		
	}
	
	webSocket.onclose = function(){
		
	}
	
	webSocket.onerror = function(error){
		
	};
	
	onmessage = function(message){
		console.log('1');
		webSocket.adminInfo['username'] = message.data;
		
	};
	
	function send(){
		console.log(webSocket.adminInfo);
		webSocket.send(JSON.stringify(webSocket.adminInfo));
	}
	
	