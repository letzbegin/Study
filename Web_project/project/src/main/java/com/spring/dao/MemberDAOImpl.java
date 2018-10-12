package com.spring.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sql;
	
	private static final String namespace = "org.spring.mapper.MemberMapper"; 
	
	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".getTime");
	}

	@Override
	public void insertMember(MemberVO vo) {
		sql.insert(namespace+".insertMember",vo);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".selectMember",userid);
	}

	@Override
	public MemberVO readWithPW(String userid, String pw) {
		// TODO Auto-generated method stub
		
		Map<String,	Object> paramap = new HashMap<>();
		paramap.put("userid", userid);
		paramap.put("userpw", pw);
		
		return sql.selectOne(namespace+".readWithPW",paramap);
	}

}