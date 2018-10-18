package com.red.pol;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WebRTCController {

	private static final Logger log = LoggerFactory.getLogger(WebRTCController.class);
	@RequestMapping("webrtc")
	public String webrtc(){
		
		return "webrtc/webrtc";
	}
	
	@ResponseBody
	@RequestMapping("ipcheck")
	public String ipcheck(HttpServletRequest request) {
		//ip확인(공인)
		//서버내부에서는 공인아이피를 가져올수 없기 때문에 클라이언트에서 값을 가져옴
		String ip = request.getParameter("myip");
		log.info("==========================================");
		log.info("유저의 IP :"+ip);
		log.info("==========================================");
		return "";
	}
}
