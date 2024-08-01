package com.study.mybatis.member.sevice;

import com.study.mybatis.member.vo.Member;

public interface MemberService {
	/* public abstract */int checkId(String userId);
	
	int insertMember(Member m);
	
	Member loginMember(Member m);
}
