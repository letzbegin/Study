package com.hanul.iot;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller @SessionAttributes("category")
public class HomeController {
	
	//오류발생시 응답할 화면에 대한 처리
	@RequestMapping("/error")
	public String error(HttpServletRequest req, Model model){
		//발생한 오류에 대한 exception객체에 오류정보가 담겨있다
		Throwable err 
			= (Throwable)req.getAttribute("javax.servlet.error.exception");
		
		StringBuilder msg = new StringBuilder();
		while( err!=null ){
			msg.append("<p>").append( err.getMessage() ).append("</p>");
			err = err.getCause();
		}
		model.addAttribute("msg", msg.toString());
		

		int code = (Integer)req.getAttribute(
						"javax.servlet.error.status_code");
		model.addAttribute("code", code);
		
		return "error/" + (code==404 ? 404 : "default");
	}
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("category", "");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
