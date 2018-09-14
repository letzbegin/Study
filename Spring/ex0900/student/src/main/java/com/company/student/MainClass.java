package com.company.student;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	public static void main(String[] args) {
		
//		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
//		
//		ctx.load("classpath:CTX.xml");
//		ctx.refresh();
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:CTX.xml");
		
		Student student = ctx.getBean("student",Student.class);
		student.info();
		
		Worker worker = ctx.getBean("worker",Worker.class);
		worker.info();
		
		ctx.close();
		
	}
}
