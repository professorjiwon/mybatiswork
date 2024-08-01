package com.study.mybatis.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.study.mybatis.member.vo.Member;

public class MemberDao {
	public int checkId(SqlSession sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}

	public int insertMember(SqlSession sqlSession, Member m) {		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member loginMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
}
