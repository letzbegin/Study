package com.company.ex10;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogAOP {
	
	@Pointcut("within(com.company.ex10.*)")
	public void ex10(){
	}
	
	
	@Around("ex10()")
	public Object loggerAOP(ProceedingJoinPoint joinPoint) throws Throwable{
		String sgt = joinPoint.getSignature().toString();
		System.out.println("시작");
		try {
			
			Object obj = joinPoint.proceed();
			return obj;
		} finally {
			// TODO: handle finally clause
			System.out.println("종료");
		}
	}
	
}
