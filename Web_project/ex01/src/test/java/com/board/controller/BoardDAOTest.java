package com.board.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Test
	public void testCreate() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setTitle("���ο� ���� �ֽ��ϴ�");
		vo.setContent("���ο� ���� �ֽ��ϴ�");
		vo.setWriter("user00");
		dao.create(vo);
	}
	
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(2).toString());
		
	}
	
	@Test
	public void update() throws Exception{
		
		BoardVO vo = new BoardVO();
		
		vo.setBno(2);
		vo.setTitle("������ ���Դϴ�");
		vo.setContent("������ �׽�Ʈ�Դϴ�");
		dao.update(vo);
		
	}
	
	@Test
	public void testDelete() throws Exception{
		
		dao.delete(2);
	}
}
