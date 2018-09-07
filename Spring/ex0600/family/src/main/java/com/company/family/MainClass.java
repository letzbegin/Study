package com.company.family;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	public static void main(String[] args) {
		
		String res1 = "classpath:CTX.xml";
		String res2 = "classpath:CTX2.xml";
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(res1,res2);
		Student student1 = ctx.getBean("student1",Student.class);
		System.out.println(student1.getName());
		System.out.println(student1.getAge());
		
		StudentInfo studentInfo = ctx.getBean("studentInfo",StudentInfo.class);
		Student student2= studentInfo.getStudent();
		System.out.println(student2.getName());
		System.out.println(student2.getAge());
		
		if(student1.equals(student2)){
			System.out.println("같습니다");
		}
		
		
	}
}
