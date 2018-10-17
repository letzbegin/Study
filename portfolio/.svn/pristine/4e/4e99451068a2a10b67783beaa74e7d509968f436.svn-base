package member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean select(String userid) {
		//해당 아이디가 존재하지 않으면 사용가능(true)한 아이디로 판단
		return (Integer)sql.selectOne(
				"member.mapper.userid", userid)>0 ? false : true;
	}

	@Override
	public MemberVO select(HashMap map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public boolean insert(MemberVO vo) {
		return sql.insert("member.mapper.insert", vo)>0 ? true : false;
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
