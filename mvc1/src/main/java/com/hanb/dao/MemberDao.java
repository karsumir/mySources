package com.hanb.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanb.dao.MemberManager;
import com.hanb.dao.MemberVo;

@Repository
public class MemberDao {
	
	
	public String loginMember(String u_id)
	{
		return MemberManager.loginMember(u_id);
	}
	
	public int insertMember(MemberVo mv)
	{
		int re=MemberManager.insert(mv);
		return re;
	}
	
	
	public int deleteMember(String u_id)
	{
		return MemberManager.deleteMember(u_id);
	}
	
	
	public int updatepwd(MemberVo vo)
	{
		return MemberManager.updatepwd(vo);
	}
	
	
	public int delete(String u_id)
	{
		return MemberManager.delete(u_id);
	}
	
	public List<MemberVo> list(HashMap<String, String> map)
	{
		return MemberManager.list(map);
	}
	
	public int updateNewPwd(String u_id, String u_pwd)
	{
		return MemberManager.updateNewPwd(u_id, u_pwd);
	}

	public int update(MemberVo vo)
	{
		return MemberManager.update(vo);
	}
	public MemberVo detail(String u_id)
	{
		return MemberManager.detail(u_id);
	}
	public String findId(String name, String email)
	{
		return MemberManager.findId(name, email);
	}
}
