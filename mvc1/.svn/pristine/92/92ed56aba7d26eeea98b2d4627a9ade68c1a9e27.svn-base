package com.hanb.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanb.dao.F_TestDao;
import com.hanb.dao.MemberDao;
import com.hanb.dao.WeatherDataDao;


@Controller
public class HomeController {
	
	@Autowired
	private F_TestDao dao;
	@Autowired
	private WeatherDataDao wDao;
	@Autowired
	private MemberDao mDao;
	
	
	@RequestMapping("/mStartPage.show")
	public ModelAndView mStartPage(HttpSession session)
	{	
		ModelAndView view=new ModelAndView("mobileMain");
		String id="";
		if(session.getAttribute("id")!=null)
		{
			id=session.getAttribute("id").toString();
			view.addObject("vo", mDao.detail(id));	
		}
		
		
		return view;
	}
	
	
	@RequestMapping("/startPage.show")
	public ModelAndView startPage()
	{	
		ModelAndView view=new ModelAndView("test03");
		
		return view;
	}
	
	
	
	@RequestMapping("/weaTher.show")
	public ModelAndView getweather(int sendTemp)
	{	
		ModelAndView view=new ModelAndView("weaTher");
		System.out.println(sendTemp);
		view.addObject("sendTemp", sendTemp);
		return view;
	}
	
	@RequestMapping("/weatherData.show")
	@ResponseBody
	public void getweatherData(HttpServletResponse res, String code)
	{		
		res.setContentType("text/xml");
		String re="";
		try{
		re=wDao.getWeatherData(code);
		PrintWriter out=res.getWriter();
		out.write(re);
		System.out.println(re);
		}catch(Exception e){e.getMessage();}
	}
	
	@RequestMapping("/favorites_view.do")
	public ModelAndView getFavorites(String u_id)
	{
		//즐겨찾기 그래프로 가기 위해 아이디를 받아야 합니다.
		System.out.println("getFavorites id="+u_id);
		ModelAndView view=new ModelAndView("favorites_View");
		view.addObject("req_id",u_id);
		return view;
	}
	@RequestMapping(value="/favorites_Post.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String getFavoritesPost(String u_id)
	{
		//즐겨찾기 Script에서 id를 요청하여 String으로 된 배열을 반환;
		System.out.println("getFavorites");
		String str=dao.getFavorites(u_id);
		return str;
	}	
}
