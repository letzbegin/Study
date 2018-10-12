package com.board.service;

import java.util.List;

import com.board.vo.BoardVO;

public interface BoardService {


	public void create(BoardVO vo ) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(Integer bno) throws Exception;
	public List<BoardVO> listAll() throws Exception;
}