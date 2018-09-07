package com.company.admin;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	public static void main(String[] args) {
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		ctx.load("classpath:CTX.xml");
		ctx.refresh();
		
		AdminConnection adminConnection = ctx.getBean("admin",AdminConnection.class);
		System.out.println(adminConnection.getAdminId());
		System.out.println(adminConnection.getAdminPw());
		System.out.println(adminConnection.getSub_adminID());
		System.out.println(adminConnection.getSub_adminPw());
		
		ctx.close();
	}
}
