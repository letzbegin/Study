package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.vo.BoardPage;
import board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(BoardVO vo) {
		return sql.insert("board.mapper.insert", vo)>0 ? true : false;
	}

	@Override
	public BoardPage list(BoardPage page) {
		page.setTotalList( 
			(Integer)sql.selectOne("board.mapper.total", page) );
		
		List<BoardVO> list = sql.selectList("board.mapper.list", page);
		page.setList(list);
		
		return page;
	}

	@Override
	public BoardVO select(int id) {
		return sql.selectOne("board.mapper.select", id);
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
