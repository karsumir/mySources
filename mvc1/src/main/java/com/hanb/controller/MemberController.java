package com.hanb.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanb.dao.MemberDao;
import com.hanb.dao.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;
	
	
	@RequestMapping(value="checkSameId.show", produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkSameId()
	{
		String str="";	
		
		List<MemberVo> list= dao.list(null);
		
			StringBuffer sb=new StringBuffer();
			sb.append("[");
			for(MemberVo m:list)
			{
				sb.append("{\"u_id\":\""+m.getU_id()+"\"},");				
			}
			str=sb.toString();
			str=str.substring(0,str.lastIndexOf(","));
			str+="]";

		return str;
	}
	
	
	@RequestMapping(value="/mLogOut.do",  method=RequestMethod.GET)
	public ModelAndView mlogOut(HttpSession session)
	{
		
		ModelAndView view = new ModelAndView("mobileMain");	
		session.removeAttribute("id");		
		return view;
	}
	
	@RequestMapping(value="/logOut.do",  method=RequestMethod.GET)
	public ModelAndView logOut(HttpSession session)
	{
		
		ModelAndView view = new ModelAndView("test03");	
		session.removeAttribute("id");
		view.addObject("login", "no");
		return view;
	}
	
	@RequestMapping(value="/checkLoginMember.show",  method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkLogin(String u_id)
	{
		String str="";
		String dbPwd=dao.loginMember(u_id); //맞는비번
		
		str="[{\"u_id\" : \""+u_id+"\", \"u_pwd\" : \""+dbPwd+"\"}]";
		
				
		return str;
	}
	
	
	@RequestMapping(value="/loginMember.show",  method=RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView view = new ModelAndView("test03");	
		return view;
	}
	
	@RequestMapping(value="/loginMember.show",  method=RequestMethod.POST)
	public ModelAndView loginOk(String u_id, String u_pwd, HttpSession session)
	{
		ModelAndView view = new ModelAndView();	
		String dbPwd=dao.loginMember(u_id); //맞는비번
		
		
		
		int re=-1;
		
		if(dbPwd!=null){
			if(dbPwd.equals(u_pwd))
			{
				session.setAttribute("id", u_id);
				re=1;
				
				view.setViewName("test03");
				view.addObject("vo", dao.detail(u_id));				
				view.addObject("login", "ok");
				view.addObject("re", "re");
			}
			else if(!dbPwd.equals(u_pwd))
			{
				re=0;
				view.setViewName("test03");
			}
		}
		else		
		{
			re=-1;
			view.setViewName("test03");
		}
		view.addObject("re", re);
		
		return view;
	}
	
	
	@RequestMapping(value="/mLoginMember.show",  method=RequestMethod.POST )
	public ModelAndView mLoginOk(String u_id, String u_pwd, HttpSession session)
	{
		ModelAndView view = new ModelAndView();	
		String dbPwd=dao.loginMember(u_id); //맞는비번
		
		
		
		int re=-1;
		
		if(dbPwd!=null){
			if(dbPwd.equals(u_pwd))
			{
				session.setAttribute("id", u_id);
				re=1;
				
				view.setViewName("mobileMain");
				view.addObject("vo", dao.detail(u_id));				
				view.addObject("re", re);
			}
			else if(!dbPwd.equals(u_pwd))
			{
				re=0;
				view.setViewName("mobileMain");
			}
		}
		else		
		{
			re=-1;
			view.setViewName("mobileMain");
		}
		view.addObject("re", re);
		
		return view;
	}
	
	
	
	
	@RequestMapping(value="/insertMember.show", method=RequestMethod.GET)
	public ModelAndView form()
	{		
		ModelAndView view=new ModelAndView("/member/insertMember");
		System.out.println("회원양식");
		return view;
	}
	
	@RequestMapping(value="/insertMember.show", method=RequestMethod.POST)
	@ResponseBody
	public void submit(MemberVo mv)
	{
		System.out.println("가입성공");
		System.out.println(mv.toString());
		dao.insertMember(mv);
		
	}
	
	@RequestMapping(value="/mInsertMember.show", method=RequestMethod.POST)	
	public ModelAndView msubmit(MemberVo mv)
	{
		ModelAndView view= new ModelAndView("mobileMain");
		System.out.println("이름:"+mv.getU_name());
		dao.insertMember(mv);
		System.out.println("가입성공");
		return view;
		
	}
	
	@RequestMapping(value="/memberDelete.do")		
	public ModelAndView memberDelete(String u_id, HttpSession session)
	{
		ModelAndView view=new ModelAndView("test03");
		System.out.println(u_id);
		dao.deleteMember(u_id);
		session.removeAttribute("id");	
		view.addObject("login", "no");
		return view;
		
	}
	
	@RequestMapping(value="/mMemberDelete.do", method=RequestMethod.POST)		
	public ModelAndView mMemberDelete(String u_id, HttpSession session)
	{
		ModelAndView view=new ModelAndView("mobileMain");
		dao.deleteMember(u_id);
		session.removeAttribute("id");		
		System.out.println("삭제성공");
		
		return view;
		
	}
	
	@RequestMapping(value="/updatePwd.do", method=RequestMethod.POST )
	@ResponseBody
	public void detailpwd(MemberVo vo)
	{
		
		dao.updatepwd(vo);

	}
	@RequestMapping(value="/updatePwd.do", method=RequestMethod.GET)
	public ModelAndView updatepwd(String u_id)
	{
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/member/updatepwd");
		MemberVo vo = dao.detail(u_id);
		view.addObject("vo", vo);
		return view;
	}
	
	@RequestMapping(value="/showMemberList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String showMemberList()
	{
		String str="";	
		
		List<MemberVo> list= dao.list(null);
		
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
			
		
		
		
		
		return str;
	}
	@RequestMapping(value="/searchMember.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchMember(String searchField, String searchSel)
	{
		String str="";
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("searchField", searchField);
		map.put("searchSel", searchSel);
		
		List<MemberVo> list= dao.list(map);
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
	
	
	
	@RequestMapping(value="/updateNewPwd.show")	
	@ResponseBody
	public void updateNewPwd(String u_id, String u_pwd)
	{
		dao.updateNewPwd(u_id, u_pwd);
	}
	
	@RequestMapping(value="/deleteMember.do")
	@ResponseBody
	public void deleteMember(String u_id)
	{
		dao.delete(u_id);
	}
	
	
	@RequestMapping(value="/findPwd.show", produces = "application/text; charset=utf8")
	@ResponseBody
	public String findId(String u_id)
	{
		String str="";
		MemberVo mv=dao.detail(u_id);
		if(mv!=null){
		String ask=mv.getU_ask();
		String ans=mv.getU_answr();
		
		str=ask+"//"+ans;
		
		}
		
		return str;
	}
	
		
	@RequestMapping(value="/findId.show", produces = "application/text; charset=utf8")
	@ResponseBody
	public String findId(String name, String email)
	{
		System.out.println(name);
		System.out.println(email);
		String str=dao.findId(name, email);
		
		return str;
	}
	
	@RequestMapping(value="/searchId.show")
	public ModelAndView searchId()
	{
		ModelAndView view = new ModelAndView("/member/searchId");	
		return view;
	}
	

	@RequestMapping(value="/managerScreen.do")
	public ModelAndView managerScreen()
	{
		ModelAndView view = new ModelAndView("/member/managerScreen");	
		view.addObject("list", dao.list(null));
		return view;
	}
	@RequestMapping(value="/updateMember.do", method=RequestMethod.GET )//update 수정양식으로 보내는곳
	public ModelAndView update(String u_id)
	{
		ModelAndView view = new ModelAndView();
		view.setViewName("/member/updateMember");
		MemberVo vo = dao.detail(u_id);
		view.addObject("vo", vo);
		return view;
	}
	
	@RequestMapping(value="/updateMember.do", method=RequestMethod.POST )//update수행하는곳
	@ResponseBody
	public void updateOk(MemberVo vo)
	{
	
		 dao.update(vo);
	
	}
	
	@RequestMapping(value="/mUpdateMember.do", method=RequestMethod.GET, produces = "application/text; charset=utf8" )//모바일 update 수정양식으로 보내는곳
	@ResponseBody
	public String mUpdate(String u_id)
	{
		String str="";		
		MemberVo m=dao.detail(u_id);
		
			StringBuffer sb=new StringBuffer();			
			
				sb.append("[{\"u_id\":\""+m.getU_id()+"\",");
				sb.append("\"u_pwd\":\""+m.getU_pwd()+"\",");
				sb.append("\"u_name\":\""+m.getU_name()+"\",");
				sb.append("\"u_email\":\""+m.getU_email()+"\",");
				sb.append("\"u_tel\":\""+m.getU_tel()+"\",");
				sb.append("\"u_addr\":\""+m.getU_addr()+"\",");
				sb.append("\"u_ask\":\""+m.getU_ask()+"\",");
				sb.append("\"u_answr\":\""+m.getU_answr()+"\",");
				sb.append("\"u_schdlr\":\""+m.getU_schdlr()+"\",");
				sb.append("\"u_memo\":\""+m.getU_memo()+"\",");
				sb.append("\"u_wthr\":\""+m.getU_wthr()+"\"}]");
				
			
			str=sb.toString();

		return str;
	}
	
	@RequestMapping(value="/mUpdateMember.do", method=RequestMethod.POST )//모바일 update수행하는곳	
	public ModelAndView mUpdateOk(MemberVo vo)
	{
		System.out.println(vo.getU_tel());
		ModelAndView view=new ModelAndView("mobileMain");
		 dao.update(vo);
		 view.addObject("vo", vo);	
		 System.out.println("수정성공");
		 return view;
	
	}
	
	
	
}
