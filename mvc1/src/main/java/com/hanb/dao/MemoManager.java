package com.hanb.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanb.dao.MemoVo;

public class MemoManager {
	
	private static SqlSessionFactory factory;
	
	static{
		try {
			Reader reader= Resources.getResourceAsReader("com/hanb/db/sqlMapper.xml");
			factory=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

	public static List<MemoVo> list(String u_id)
	{
		List<MemoVo> list=null;
		SqlSession session=factory.openSession();
		list=session.selectList("memo.list", u_id);
		for(MemoVo m : list){
			if(m.getM_content().length() > 20){
				m.setM_temp(m.getM_content().substring(0, 15));				
			}
			else{
				m.setM_temp(m.getM_content());
			}
		}
		session.close();
		return list;
	}
	
	public static MemoVo detail(int m_num)
	{
		MemoVo m=null;
		SqlSession session=factory.openSession();
		m=session.selectOne("memo.detail",m_num);
		session.close();
		return m;
	}
	
	public static int MaxMemo()
	{
		int re=-1;
		SqlSession session=factory.openSession();
		re=session.selectOne("memo.maxNum");
		session.close();
		return re;
	}
	
	public static int insert(MemoVo m)
	{
		int re=-1;
		SqlSession session=factory.openSession(true);
		
		re=session.insert("memo.insert", m);
		session.close();
		return re;
	}
	
	public static int update(MemoVo m)
	{
		int re=-1;
		SqlSession session=factory.openSession(true);
		re=session.insert("memo.update", m);
		session.close();
		return re;
	}
	
	public static int delete(int m_num)
	{
		int re=-1;
		SqlSession session=factory.openSession(true);
		re=session.delete("memo.delete",m_num);
		session.close();
		return re;
	}
	
}
