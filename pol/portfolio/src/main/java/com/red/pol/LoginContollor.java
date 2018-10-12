package com.red.pol;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class LoginContollor {
	private Log log = LogFactory.getLog(LoginContollor.class);  
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model){
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		log.info("=================================");
		log.info("로그인 컨트롤러 들어옴");
		log.info("아이디:" + userid);
		log.info("비밀번호:"+userpwd);
		log.info("=================================");
		
		model.addAttribute("user_info",userid);
		return userid;
	}
	
	@RequestMapping("logout")
	public void logout(SessionStatus session){
		session.setComplete();
	}
	
	
}
