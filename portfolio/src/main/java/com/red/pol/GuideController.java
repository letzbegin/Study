package com.red.pol;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	
	
	@RequestMapping("guide")
	public String guide(){
		
		return "guide/guide";
	}
	
}
