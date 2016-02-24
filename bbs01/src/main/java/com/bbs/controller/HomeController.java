package com.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.dao.BbsDao;
import com.bbs.vo.BbsVo;

@Controller
public class HomeController {
	BbsDao dao = new BbsDao();
	@RequestMapping(value = "insert.do", method = RequestMethod.GET)
	public ModelAndView insertPage() {
		ModelAndView mav = new ModelAndView("insertPage");
		return mav;
	}
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public ModelAndView insert(BbsVo v) {
		ModelAndView mav = new ModelAndView();
		int re = 0;
		re = dao.insert(v);
		mav.addObject("re", re);
		mav.setViewName("result");
		System.out.println("controller re = "+re);
		return mav;
	}
	
}
