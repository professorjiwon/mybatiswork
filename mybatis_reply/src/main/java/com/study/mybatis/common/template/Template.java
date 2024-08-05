package com.study.mybatis.common.template;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {
	public static SqlSession getSqlSession() {
		SqlSession sqlSession = null;
		
		// SqlSession을 생성하기 위해 => SqlSessionFactory 필요
		// SqlSessionFactory => SqlSessionFactoryBuilder 필요
		
		String resource = "/mybatis-config.xml";
		
		try {
			InputStream stream = Resources.getResourceAsStream(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(stream).openSession(false);
			// openSession() : 자동커밋의 여부
			//                 false(기본값)  => 개발자가 commit해줌
			//                 true => 자동커밋
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSession;
	}
}