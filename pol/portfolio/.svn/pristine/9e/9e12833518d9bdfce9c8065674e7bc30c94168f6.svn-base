package member.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDAO;
import member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private MemberDAO dao;
	
	@Override
	public boolean select(String userid) {
		return dao.select(userid);
	}

	@Override
	public MemberVO select(HashMap map) {
		return dao.select(map);
	}

	@Override
	public boolean insert(MemberVO vo) {
		return dao.insert(vo);
	}

	@Override
	public boolean update(MemberVO vo) {
		return false;
	}

	@Override
	public boolean delete(String userid) {
		return false;
	}

}
