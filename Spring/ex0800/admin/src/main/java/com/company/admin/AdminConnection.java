package com.company.admin;

import org.hibernate.cfg.Environment;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.EnvironmentAware;

public class AdminConnection  implements EnvironmentAware,InitializingBean, DisposableBean{

	private org.springframework.core.env.Environment env;
	private String id;
	private String pwd;
	
	//객체가 생성되면 가장 먼저 실행되는 메서드
	@Override
	public void setEnvironment(org.springframework.core.env.Environment arg0) {
		// 캐스팅이 안되기 땐문에 setter 메서드를 통해서 처리 해야됨;;
//		environment = (Environment)arg0;
		System.out.println("setEnvironment()");
		setEnv(arg0);
	}
	
	

	public org.springframework.core.env.Environment getEnv() {
		return env;
	}







	public void setEnv(org.springframework.core.env.Environment arg0) {
		this.env = arg0;
	}







	public String getId() {
		return id;
	}







	public void setId(String id) {
		this.id = id;
	}







	public String getPwd() {
		return pwd;
	}







	public void setPwd(String pwd) {
		this.pwd = pwd;
	}







	//빈이 생성되면 가장 먼저 실행되는 메서드
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("afterPropertiesSet()");
		setId(env.getProperty("admin.id"));
		setPwd(env.getProperty("admin.pwd"));
	}
		
	//빈이 소멸하면 실행되는 메서드
	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("destroy()");
	}
		
	
}
