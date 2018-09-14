package com.company.ex10;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	
	public static void main(String[] args) {
		
		
	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
	ctx.load("classpath:CTX.xml");
	ctx.refresh();
	
	
	Student student=ctx.getBean("student",Student.class);
	student.info();
	
	ctx.close();
	
	}
}
