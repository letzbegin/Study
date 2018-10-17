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
		//ipȮ��(����)
		//�������ο����� ���ξ����Ǹ� �����ü� ���� ������ Ŭ���̾�Ʈ���� ���� ������
		String ip = request.getParameter("myip");
		log.info("==========================================");
		log.info("������ IP :"+ip);
		log.info("==========================================");
		return "";
	}
}
