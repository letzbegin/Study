package com.company.pencil;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	
	public static void main(String[] args) {
		
		String res = "classpath:CTX.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(res);
		Pencil pencil = ctx.getBean("pencil",Pencil.class);
		
		pencil.use();
		
		
		ctx.close();
		
		
		
	}
	
	
}
	