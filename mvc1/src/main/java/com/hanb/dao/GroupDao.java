package com.hanb.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanb.dao.GroupManager;
import com.hanb.dao.GroupMasterVo;

@Repository
public class GroupDao {
	
	public int deleteGroup(int g_id)
	{
		return GroupManager.delete(g_id);
	}	
	public int updateGroup(GroupMasterVo gv)
	{
		return GroupManager.update(gv);
	}	
	public GroupMasterVo detailGroup(int g_id)
	{
		return GroupManager.detail(g_id);
	}	
	public int maxNo()
	{
		return GroupManager.maxNo();
	}	
	public List<GroupMasterVo> listGroup(HashMap<String, Object> map)
	{
		List<GroupMasterVo> list = GroupManager.list(map);
		System.out.println(list);
		return list;
	}	
	public List<GroupMasterVo> selectGid(HashMap<String, String> map)
	{
		List<GroupMasterVo> list = GroupManager.selectGid(map);
		System.out.println(list);
		return list;
	}
	public int insertGroup(GroupMasterVo gv)
	{
		return GroupManager.insert(gv);
	}
 
}
