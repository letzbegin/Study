package notice.dao;

import java.util.HashMap;
import java.util.List;

import notice.vo.NoticePage;
import notice.vo.NoticeVO;

public interface NoticeDAO {
	//CRUD : insert/update: �����Ͱ�ü�� �Ķ���ͷ� ����
	boolean insert(NoticeVO vo);
	List<NoticeVO> list();
	List<NoticeVO> list(HashMap<String, String> map);
	NoticePage list(NoticePage page);
	NoticeVO select(int id);
	boolean update(NoticeVO vo);
	boolean delete(int id);
	void read(int id);
	boolean reply_insert(NoticeVO vo);
}
