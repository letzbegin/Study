package com.spring.project;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {

	private static final String DRIVER ="com.mysql.jdbc.Driver"; 
	private static final String URL ="jdbc:mysql://127.0.0.1:3306/book_ex?useSSL=false"; 
	private static final String USER ="web"; 
	private static final String PW ="0000"; 
	
	
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		
		try(Connection conn = DriverManager.getConnection(URL, USER, PW)){
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
