package com.hanb.dao;


import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.core.io.Resource;

import com.hanb.dao.MemberVo;

public class MemberManager {

	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader	= Resources.getResourceAsReader("com/hanb/db/sqlMapper.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			//reader가 db접속하는 xml을 읽어서 builder가 접속한다.
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	
	}
	
	public static int insert(MemberVo mv)
	{
		SqlSession session = factory.openSession(true);
		int re = session.insert("member.insert", mv);		
		session.close();
		return re;
	}
	
	public static int deleteMember(String u_id)
	{
		int re =-1;
		System.out.println("null로 바꾸는 쿼리 실행");
		SqlSession session = factory.openSession(true);
		re = session.update("member.memberDelete", u_id);
		session.close();
		return re;
		
	}
	
	public static String loginMember(String u_id)
	{
		
		SqlSession session = factory.openSession(true);
		String str = session.selectOne("member.loginMember", u_id);
		session.close();
		return str;
		
	}
	
	
	
	
	public static int updatepwd(MemberVo vo)
	{
		int re =-1;
		SqlSession session = factory.openSession(true);
		re = session.update("member.updatepwd",vo);
		session.close();
		return re;
		
	}
	
	public static int delete(String u_id)
	{
		int re=-1;
		SqlSession session=factory.openSession(true);
		re=session.update("member.delete", u_id);
		session.close();
		return re;
	}
	
	public static List<MemberVo> list(HashMap<String, String> map)
	{
		SqlSession session=factory.openSession();
		List<MemberVo> list=session.selectList("member.list",map);
		session.close();
		return list;
	}
	
	
	
	public static String findId(String name, String email)
	{
		SqlSession session = factory.openSession();
		HashMap map=new HashMap();
		map.put("name", name);
		map.put("email", email);
		String str=session.selectOne("member.findId", map);
		session.close();
		return str;
		
	}
	
	public static int updateNewPwd (String u_id, String u_pwd)
	{
		int re = -1;
		SqlSession session = factory.openSession(true);
		HashMap map=new HashMap();
		map.put("u_id", u_id);
		map.put("u_pwd", u_pwd);
		re = session.update("member.updateNewPwd",map);
		session.close();
		return re;

	}
	
	public static int update (MemberVo vo)
	{
		int re = -1;
		
		SqlSession session = factory.openSession(true);//db가져오기
		re = session.update("member.update", vo	 );// memebermapper에 질의문을 수행한다.
		session.close();
		
		return re;
		
		
		
	}
	
	public static MemberVo detail(String u_id)
	{
		System.out.println(factory);
		SqlSession session = factory.openSession();//값을 변동안하니깐 true필요없다
		MemberVo vo = session.selectOne("member.detail", u_id);
		session.close();
		return vo;
	}
	
}
