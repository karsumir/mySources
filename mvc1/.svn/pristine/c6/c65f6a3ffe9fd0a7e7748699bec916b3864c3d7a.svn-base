package com.hanb.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanb.dao.GroupMasterVo;

public class GroupManager {
	
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
	public static int delete(int g_id)
	{
		SqlSession session=factory.openSession(true);
		int re=session.update("group.delete", g_id);
		session.close();
		return re;
	}	
	public static int update(GroupMasterVo gv)
	{
		SqlSession session=factory.openSession(true);
		int re=session.update("group.update", gv);
		session.close();
		return re;
	}
	
	public static GroupMasterVo detail(int g_id)
	{
		SqlSession session=factory.openSession();
		GroupMasterVo gv=session.selectOne("group.detail", g_id);
		session.close();
		return gv;
	}
	
	public static int maxNo()
	{
		SqlSession session=factory.openSession();
		int max=session.selectOne("group.maxNo");
		session.close();
		return max;
	}
	
	
	public static int insert(GroupMasterVo gv)
	{
		SqlSession session=factory.openSession(true);		
		int re=session.insert("group.insert", gv);		
		session.close();
		return re;
	}
	
	public static List<GroupMasterVo> list(HashMap<String, Object> map)
	{
		SqlSession session=factory.openSession(true);
		System.out.println(map);
		List<GroupMasterVo> list=session.selectList("group.list", map);
		session.close();
		return list;
	}
	
	public static List<GroupMasterVo> selectGid(HashMap<String, String> map)
	{
		SqlSession session=factory.openSession(true);
		System.out.println(map);
		List<GroupMasterVo> list=session.selectList("group.selectGid", map);
		session.close();
		return list;
	}

}
