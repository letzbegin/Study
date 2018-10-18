package notice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import notice.vo.NoticePage;
import notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired private SqlSession sql;
	
	public boolean insert(NoticeVO vo) {
		return sql.insert("notice.mapper.insert", vo)>0? true: false;
	}

	public List<NoticeVO> list() {
		return sql.selectList("notice.mapper.list");
	}

	public NoticeVO select(int id) {
		return sql.selectOne("notice.mapper.select", id);
	}

	public boolean update(NoticeVO vo) {
		return sql.update("notice.mapper.update", vo)>0 ? true : false;
	}

	public boolean delete(int id) {
		return sql.delete("notice.mapper.delete", id)>0 ? true : false;
	}

	@Override
	public void read(int id) {
		sql.update("notice.mapper.read", id);
	}

	@Override
	public boolean reply_insert(NoticeVO vo) {
		return sql.insert("notice.mapper.reply", vo)>0 ? true: false;
	}

	@Override
	public List<NoticeVO> list(HashMap<String, String> map) {
		return sql.selectList("notice.mapper.list", map);
	}

	@Override
	public NoticePage list(NoticePage page) {
		//총공지글목록수를 조회해와 NoticePage의 totalList 필드에 담는다.
		page.setTotalList(
			(Integer)sql.selectOne("notice.mapper.total", page) );
		
		List<NoticeVO> list = sql.selectList("notice.mapper.list", page);
		page.setList(list);
		
		return page;
	}

}
