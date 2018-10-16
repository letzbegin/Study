package com.red.pol;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebRTCController {

	
	@RequestMapping("webrtc")
	public String webrtc(){
		
		return "webrtc/webrtc";
	}
}
