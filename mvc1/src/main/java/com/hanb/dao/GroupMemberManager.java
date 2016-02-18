package com.hanb.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanb.dao.GroupMemberVo;

public class GroupMemberManager {
	
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
	public static int deleteGroupMember(String u_id)
	{
		SqlSession session=factory.openSession(true);
		int re=session.update("groupMember.delete", u_id);
		session.commit();
		session.close();
		return re;
	}	
	public static int updateGroupMember(GroupMemberVo gmv)
	{
		SqlSession session=factory.openSession(true);
		int re=session.update("groupMember.update", gmv);
		session.commit();
		session.close();
		return re;
	}
	
	public static GroupMemberVo detailGroupMember(HashMap<String, Object> map)
	{
		SqlSession session=factory.openSession();
		GroupMemberVo gmv=session.selectOne("groupMember.detail", map);
		session.close();
		return gmv;
	}
	
	public static int insert(GroupMemberVo gmv)
	{
		SqlSession session=factory.openSession(true);		
		int re=session.insert("groupMember.insert", gmv);
		session.commit();
		session.close();
		return re;
	}
	
	public static List<GroupMemberVo> list(HashMap<String, Object> map)
	{
		SqlSession session=factory.openSession(true);
		System.out.println(map);
		List<GroupMemberVo> list = session.selectList("groupMember.list", map);
		session.close();
		return list;
	}
	
	public static List<MemberVo> searchGroupMember(HashMap<String, String> map)
	{
		SqlSession session=factory.openSession();
		List<MemberVo> list=session.selectList("groupMember.searchGroupMember",map);
		session.close();
		return list;
	}
	public static List<GroupMemberVo> listInviteGroupMember(HashMap<String, Object> map)
	{
		SqlSession session=factory.openSession(true);
		System.out.println(map);
		List<GroupMemberVo> list = session.selectList("groupMember.inviteGroupMember", map);
		session.close();
		return list;
	}
	public static int updateRegy(GroupMemberVo gmv)
	{
		SqlSession session=factory.openSession(true);		
		int re=session.insert("groupMember.updateRegy", gmv);
		session.commit();
		session.close();
		return re;
	}

}
