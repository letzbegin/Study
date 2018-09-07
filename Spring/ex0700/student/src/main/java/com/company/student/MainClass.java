package com.company.student;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:CTX.xml");
		
		Student student1 = ctx.getBean("student",Student.class);
		System.out.println(student1.getName());
		
		Student student2 = ctx.getBean("student",Student.class);
		student2.setName("홍길순");
		System.out.println(student2.getName());
		
		if(student1.equals(student2)){
			System.out.println("같습니다");
		}
		
		
	}

}
