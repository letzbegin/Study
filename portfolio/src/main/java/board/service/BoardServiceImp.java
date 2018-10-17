package board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.vo.BoardPage;
import board.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired private BoardDAO dao;
	
	@Override
	public boolean insert(BoardVO vo) {
		return dao.insert(vo);
	}

	@Override
	public BoardPage list(BoardPage page) {
		return dao.list(page);
	}

	@Override
	public BoardVO select(int id) {
		return dao.select(id);
	}

	@Override
	public boolean update(BoardVO vo) {
		return false;
	}

	@Override
	public boolean delete(int id) {
		return false;
	}

}
