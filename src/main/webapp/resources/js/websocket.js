/* 웹소켓 관련 */
var ws;
	   
$(function() {
    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
        writeResponse("WebSocket is already opened.");
        return;
    }
    //웹소켓 객체 만드는 코드
    ws = new WebSocket("ws://192.168.30.199:8001/gw/wesocket");
    
    ws.onopen = function(event){
    	//alert("소켓 연결 성공!");
        if(event.data === undefined) return;
        
        writeResponse(event.data);
    };
    ws.onmessage = function(event){
        writeResponse(event.data);
    };
    ws.onclose = function(event){
        writeResponse("Connection closed");
    }
});