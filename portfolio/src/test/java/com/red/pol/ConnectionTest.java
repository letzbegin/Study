package com.red.pol;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnectionTest {

	private static final String Driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@221.144.97.134:1521/xe";
	private static final String username = "team2";
	private static final String password= "0000";
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(Driver);
		
		try(Connection conn = DriverManager.getConnection(url, username, password)){
			
			System.out.println("접속성공");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	
}
