<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

</head>
<body>

<script type="text/javascript">
    var websocket;
    
    if (!websocket) {
        websocket = new SockJS('http://localhost:8088/chat');
        websocket.onopen = function (evt) {
            onOpen(evt)
        };
        websocket.onmessage = function (evt) {
            onMessage(evt)
        };
        websocket.onerror = function (evt) {
            onError(evt)
        };
    }
    
    function send_message() {
        var message = $('#s-msg').val();
        websocket.send(message);
    }

    function onOpen(evt) {
        websocket.send('채팅방에 접속했습니다.');
    }

    function onMessage(evt) {
        writeToScreen("Message : " + evt.data);
    }

    function onError(evt) {
        writeToScreen('ERROR: ' + evt.data);
    }

    function writeToScreen(message) {
        $('#output').append('<p>'+message+'<p>');
    }
    
</script>

<div class="container">
	<div style="text-align: center;">
		<div class="input-group mb-3">
		  <input type="text" class="form-control" id="s-msg" name="message">
		  <div class="input-group-append">
		    <button class="btn btn-primary" type="button" onclick="send_message()">메시지 보내기</button>
		  </div>
		</div>
	</div>
	<div id="output"></div>
</div>

</body>
</html>