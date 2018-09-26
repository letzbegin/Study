package com.spring.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.vo.ProductVo;

@Controller
public class SampleController5 {
	
	@RequestMapping("/doJson")
	public @ResponseBody ProductVo doJson(){
		
		ProductVo vo = new ProductVo("ป๙วร", 5000);
		
		return vo;
	}

}
