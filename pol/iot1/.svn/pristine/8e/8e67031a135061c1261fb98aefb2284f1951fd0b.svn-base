package notice.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.dao.NoticeDAO;
import notice.vo.NoticePage;
import notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;
	
	public boolean insert(NoticeVO vo) {
		return dao.insert(vo);
	}

	public List<NoticeVO> list() {
		return dao.list();
	}

	public NoticeVO select(int id) {
		return dao.select(id);
	}

	public boolean update(NoticeVO vo) {
		return dao.update(vo);
	}

	public boolean delete(int id) {
		return dao.delete(id);
	}

	@Override
	public void read(int id) {
		dao.read(id);
	}

	@Override
	public boolean reply_insert(NoticeVO vo) {
		return dao.reply_insert(vo);
	}

	@Override
	public List<NoticeVO> list(HashMap<String, String> map) {
		return dao.list(map);
	}

	@Override
	public NoticePage list(NoticePage page) {
		return dao.list(page);
	}

}
