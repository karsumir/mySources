package com.hanb.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanb.dao.GroupMemberManager;
import com.hanb.dao.GroupMemberVo;

@Repository
public class GroupMemberDao {
	
	public int deleteGroupMember(String u_id)
	{
		return GroupMemberManager.deleteGroupMember(u_id);		
	}	
	public int updateGroupMember(GroupMemberVo gmv)
	{
		return GroupMemberManager.updateGroupMember(gmv);
	}	
	public GroupMemberVo detailGroupMember(HashMap<String, Object> map)
	{
		return GroupMemberManager.detailGroupMember(map);
	}	
	public List<GroupMemberVo> listGroupMember(HashMap<String, Object> map)
	{
		List<GroupMemberVo> list = GroupMemberManager.list(map);
		System.out.println(list);
		return list;
	}	
	public int insertGroupMember(GroupMemberVo gmv)
	{
		return GroupMemberManager.insert(gmv);
	}
	
	public List<MemberVo> searchGroupMember(HashMap<String, String> map)
	{
		return GroupMemberManager.searchGroupMember(map);
	}
	public List<GroupMemberVo> listInviteGroupMember(HashMap<String, Object> map)
	{
		List<GroupMemberVo> list = GroupMemberManager.listInviteGroupMember(map);
		System.out.println(list);
		return list;
	}
	public int updateRegy(GroupMemberVo gmv)
	{
		return GroupMemberManager.updateRegy(gmv);
	}
}
