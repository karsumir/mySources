package com.hanb.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class F_TestManager {

	private static SqlSessionFactory ssf;
	
	static{
		try{
			Reader r=Resources.getResourceAsReader("com/hanb/db/sqlMapper.xml");
			ssf=new SqlSessionFactoryBuilder().build(r);
		}catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	public static F_TestVo getFavorites(String u_id)
	{
		//즐겨찾기 빈도수를 받아오기 위한 메소드
		System.out.println("아이디:"+u_id);
		SqlSession session = ssf.openSession(true);
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("u_id", u_id);
		F_TestVo fv = session.selectOne("favorites.getFavorites",map);
		session.close();
		return fv;		
	}	
}