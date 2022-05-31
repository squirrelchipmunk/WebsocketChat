package com.exam.ws.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/websocket")
	public String ws() {
		return "websocket";
	}
	
	// sockjs를 사용하면 웹소켓을 지원하는 브라우저에서는 웹 소켓을 사용하고 
	// 웹소켓을 지원하지 않는 브라우저에서는 폴링 방식으로 동작하여 연결된 것처럼 사용 가능.
	
	@GetMapping("/sockjs")
	public String index() {
		return "sockjs";
	}
	
	
}
