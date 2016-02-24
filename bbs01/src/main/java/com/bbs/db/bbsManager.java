package com.bbs.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bbs.vo.BbsVo;

public class bbsManager {
	private static SqlSessionFactory factory;
	static{
		try {
			Reader reader = Resources.getResourceAsReader("com/bbs/db/bbsMapper.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
	public static int insert(BbsVo v){
		int re = 0;
		SqlSession session = factory.openSession(true);
		re=session.insert("sql_bbs.insert", v);
		System.out.println("vo : "+v);
		session.close();
		System.out.println("manager Vo : "+v);
		return re;
	}

}
