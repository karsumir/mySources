package com.hanb.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanb.dao.GroupDao;
import com.hanb.dao.GroupMemberDao;
import com.hanb.dao.GroupMemberVo;
import com.hanb.dao.MemberVo;
import com.hanb.dao.GroupMasterVo;

@Controller
public class GroupMemberController {
	
	@Autowired
	private GroupMemberDao dao;
	
	@RequestMapping(value="/listGroupMember.do")
	public ModelAndView listGroupMember(GroupMemberVo gmv)
	{
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("g_id", gmv.getG_id());
		ModelAndView mv=new ModelAndView("/group/listGroupMember");
		mv.addObject("list", dao.listGroupMember(map));		
		return mv;
	}	
	@RequestMapping(value="/deleteGroupMember.do")
	public ModelAndView deleteGroupMember(HttpServletRequest req, String u_id)
	{
		ModelAndView mv=new ModelAndView();		
		int re=dao.deleteGroupMember(u_id);	
		if(re==1)
		{
			mv.setViewName("redirect:listGroupMember.do");
			return mv;
		}
		return mv;
	}	
	@RequestMapping(value="/updateGroupMember.do", method=RequestMethod.GET)
	public ModelAndView updateGroupMember(String g_id, String u_id)
	{
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("g_id", g_id);
		map.put("u_id", u_id);
		ModelAndView mv=new ModelAndView("/group/updateGroupMember");
		mv.addObject("gmv", dao.detailGroupMember(map));		
		return mv;
	}
	
	@RequestMapping(value="/updateGroupMember.do", method=RequestMethod.POST,produces="application/text;charset=utf8")
	@ResponseBody
	public ModelAndView updateGroupMemberOk(HttpServletRequest req, GroupMemberVo gmv)
	{
		ModelAndView mv=new ModelAndView("/group/updateGroupMember");				
		int re=dao.updateGroupMember(gmv);
		mv.setViewName("redirect:listGroupMember.do");	
		return mv;
	}
			
	@RequestMapping(value="/detailGroupMember.do")
	public ModelAndView detailGroup(String g_id, String u_id)
	{
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("g_id", g_id);
		map.put("u_id", u_id);
		ModelAndView mv=new ModelAndView("/group/detailGroupMember");
		
		System.out.println(u_id);
		mv.addObject("gmv", dao.detailGroupMember(map));
		return mv;
	}	
	@RequestMapping(value="/insertGroupMember.do", method=RequestMethod.GET)
	public ModelAndView form(int g_id)
	{
		ModelAndView mv=new ModelAndView("/group/insertGroupMember");
		mv.addObject("g_id", g_id);
		System.out.println(g_id);
		return mv;
	}	
	@RequestMapping(value="/insertGroupMember.do", method=RequestMethod.POST,produces="application/text;charset=utf8")
	@ResponseBody
	public ModelAndView submit(GroupMemberVo gmv, HttpServletRequest req)
	{		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("redirect:listGroupMember.do");	
		dao.insertGroupMember(gmv);
		return mv;
	}
	
	@RequestMapping(value="/searchGroupMember.do")
	public ModelAndView searchGroupMember(String g_id)
	{		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/group/searchGroupMember");	
		mv.addObject("g_id", g_id);
		return mv;
	}
	
	@RequestMapping(value="/searchListMember.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchMember(String searchField, String searchSel, String g_id)
	{
		String str="";
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("searchField", searchField);
		map.put("searchSel", searchSel);
		map.put("g_id", g_id);
		
		System.out.println("searchField:" + searchField);
		
		List<MemberVo> list= dao.searchGroupMember(map);
		if(list.size()!=0)
		{
			StringBuffer sb=new StringBuffer();
			sb.append("[");
			for(MemberVo m:list)
			{
				sb.append("{\"u_name\":\""+m.getU_name()+"\",");
				sb.append("\"u_id\":\""+m.getU_id()+"\",");
				sb.append("\"u_tel\":\""+m.getU_tel()+"\",");
				sb.append("\"u_email\":\""+m.getU_email()+"\"},");
			}
			str=sb.toString();
			str=str.substring(0,str.lastIndexOf(","));
			str+="]";
			
		}
		System.out.println(str);
		
		return str;
	}
	
	@RequestMapping(value="/saveGroupMember.do", produces="application/text;charset=utf8")
	@ResponseBody
	public String saveGroupMember(HttpServletRequest request, int g_id, String u_idList)
	{
		String rtn = "[{\"rtn\":1}]";
		HttpSession session = request.getSession();
		//session.setAttribute("id", "choa");
		String chief_u_id = (String)session.getAttribute("id");
		System.out.println("g_id:" + g_id + " u_idList:" + u_idList);
		String list[] = u_idList.split(" ");
		
		for(int i=0; i<list.length; i++)
		{
			System.out.println("list["+ i +"]" + list[i]);
			GroupMemberVo gmVo = new GroupMemberVo();
			gmVo.setG_id(g_id);
			gmVo.setU_id(list[i]);
			gmVo.setChief_u_id(chief_u_id);
			dao.insertGroupMember(gmVo);
		}
		return rtn;
	}
	
	@RequestMapping(value="/listInviteGroupMember.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String listInviteGroupMember(HttpServletRequest request)
	{
		String str="";
		HashMap<String, Object> map=new HashMap<String, Object>();
		HttpSession session = request.getSession();
		//session.setAttribute("id", "apple");
		String u_id = (String)session.getAttribute("id");
		map.put("u_id", u_id);
		
		List<GroupMemberVo> list= dao.listInviteGroupMember(map);
		if(list.size()!=0)
		{
			StringBuffer sb=new StringBuffer();
			sb.append("[");
			for(GroupMemberVo m : list)
			{
				sb.append("{\"g_id\":\""+m.getG_id()+"\",");
				sb.append("\"g_name\":\""+m.getG_name()+"\",");
				sb.append("\"u_id\":\""+m.getU_id()+"\"},");
			}
			str=sb.toString();
			str=str.substring(0,str.lastIndexOf(","));
			str+="]";
			
		}
		System.out.println(str);
		
		return str;
	}
	
	@RequestMapping(value="/inviteGroupMemberOk.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateRegy(HttpServletRequest request, String g_idList)
	{
		String rtn = "[{\"rtn\":1}]";
		HttpSession session = request.getSession();
		session.setAttribute("id", "apple");
		String u_id = (String)session.getAttribute("id");
		System.out.println("u_id:" + u_id + " g_idList:" + g_idList);
		
		if (g_idList==null) return rtn;
		String list[] = g_idList.split(" ");
		
		for(int i=0; i<list.length; i++)
		{
			System.out.println("list["+ i +"]:" + list[i]);
			GroupMemberVo gmVo = new GroupMemberVo();
			gmVo.setG_id(Integer.parseInt(list[i]));
			gmVo.setU_id(u_id);
			gmVo.setRegY(1);
			dao.updateRegy(gmVo);
		}
		return rtn;
	}
}
