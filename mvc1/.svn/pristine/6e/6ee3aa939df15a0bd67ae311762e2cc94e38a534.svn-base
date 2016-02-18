package com.hanb.controller;


import java.util.HashMap;
import java.util.Iterator;
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
import com.hanb.dao.GroupMasterVo;
import com.hanb.dao.GroupMemberVo;

@Controller
public class GroupController {
	
	@Autowired
	private GroupDao gdao;
	
	@Autowired
	private GroupMemberDao mdao;
	
	@RequestMapping(value="/deleteGroup.do")
	public ModelAndView deleteGroup(HttpServletRequest req, int g_id)
	{
		ModelAndView mv=new ModelAndView();		
		int re= gdao.deleteGroup(g_id);		
		if(re==1)
		{
			mv.setViewName("redirect:listGroup.do");
			return mv;
		}
		return mv;
	}
	
	@RequestMapping(value="/updateGroup.do", method=RequestMethod.GET)
	public ModelAndView updateGroup(int g_id)
	{
		ModelAndView mv=new ModelAndView("/group/updateGroup");
		mv.addObject("gv", gdao.detailGroup(g_id));		
		return mv;
	}
	
	@RequestMapping(value="/updateGroup.do", method=RequestMethod.POST,produces="application/text;charset=utf8")
	@ResponseBody
	public ModelAndView updateGroupOk(HttpServletRequest req, GroupMasterVo gv)
	{
		ModelAndView mv=new ModelAndView("/group/updateGroup");				
		int re=gdao.updateGroup(gv);
		mv.setViewName("redirect:listGroup.do");	
		return mv;
	}
			
	@RequestMapping(value="/detailGroup.do")
	public ModelAndView detailGroup(int g_id)
	{
		ModelAndView mv=new ModelAndView("/group/detailGroup");
		mv.addObject("gv", gdao.detailGroup(g_id));
		return mv;
	}
	
	@RequestMapping(value="/insertGroup.do", method=RequestMethod.GET)
	public ModelAndView form()
	{
		
		ModelAndView mv=new ModelAndView("/group/insertGroup");
		mv.addObject("maxNo",gdao.maxNo());
		return mv;
	}
	
	@RequestMapping(value="/insertGroup.do", method=RequestMethod.POST,produces="application/text;charset=utf8")
	@ResponseBody
	public ModelAndView submit(GroupMasterVo gv, HttpServletRequest req, GroupMemberVo gmv)
	{
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("redirect:listGroup.do");	
		gdao.insertGroup(gv);
		mdao.insertGroupMember(gmv);
		return mv;
	}

	@RequestMapping(value="/listGroup.do")
	public ModelAndView listGroup(GroupMasterVo gv)
	{
		HashMap<String,Object> map = new HashMap<String, Object>(); 
		ModelAndView mv=new ModelAndView("/group/listGroup");
		mv.addObject("list", gdao.listGroup(map));		
		return mv;
	}
	
	@RequestMapping(value="/selectGid.do", produces="application/text;charset=utf8")
	@ResponseBody
	public String selectGid(HttpServletRequest request, GroupMasterVo gv)
	{
		HttpSession session = request.getSession();
		//session.setAttribute("id", "choa");
		String u_id = (String)session.getAttribute("id");
		HashMap<String,String> map = new HashMap<String, String>(); 
		map.put("u_id", u_id);
		gv.setU_id(u_id);
		System.out.println("u_id:" + gv.getU_id());
		
		StringBuffer sb     = new StringBuffer();
		sb.append("[");
		sb.append("");
		List<GroupMasterVo> list = gdao.selectGid(map);
		for (Iterator GroupMasterVo = list.iterator(); GroupMasterVo.hasNext();) {
			GroupMasterVo vo = (GroupMasterVo) GroupMasterVo.next();
			sb.append("{");
			sb.append("\"g_id\":"      +vo.getG_id()    +",");
			sb.append("\"g_name\":\""  +vo.getG_name()  +"\"");
			sb.append("},");
		}
		if (sb.length() > 2)
		{
			sb.deleteCharAt(sb.lastIndexOf(","));
			//System.out.println("sb  : " + sb);
		}
		sb.append("]");
		System.out.println(sb);
		
		return sb.toString();
	}
}
