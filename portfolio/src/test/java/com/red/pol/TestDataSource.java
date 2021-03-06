package com.red.pol;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestDataSource {
	
	@Inject
	private DataSource ds;
	
	@Test
	public void testConnectionDataSource() throws Exception{
		
		try(Connection conn = ds.getConnection()){
			System.out.println("���Ӽ���");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
