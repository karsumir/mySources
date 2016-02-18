package com.hanb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanb.dao.J_calendar_today_Dao;
import com.hanb.dao.MemoDao;
import com.hanb.dao.ScheduleDao;
import com.hanb.dao.ScheduleVo;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleDao dao;
	
	@Autowired
	MemoDao m_dao;
	
	@Autowired
	J_calendar_today_Dao dao2;
	
	@RequestMapping(value="getCalendar_Today.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCalendar_Today(String u_id){
		//메인에 뿌려줄 오늘의 종료 일정
		System.out.println(u_id);
		String str="";
		str=dao2.getCalendar_Today(u_id);
		return str;
	}
	
	@RequestMapping(value="getCalendar_Today_Area.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCalendar_Today_Area(String u_id){
		//메인에 뿌려줄 오늘이 포함된 일정
		System.out.println(u_id);
		String str="";
		str=dao2.getCalendar_Today_area(u_id);
		return str;
	}
	
	@RequestMapping(value="calendar.do")
	public ModelAndView getCalendar(HttpServletRequest request, String m_num, String u_id){
		
		HttpSession session = request.getSession();
		u_id = (String)session.getAttribute("id");
		
		System.out.println(u_id);
		ModelAndView mView = new ModelAndView();
		System.out.println(m_num);
		if(m_num != null){
			mView.addObject("m",m_dao.detail(Integer.parseInt(m_num)));
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id",       u_id);
		
		mView.addObject("u_id", dao.forCalendar(map));
		mView.setViewName("calendar");
		return mView;
	}
	
	@RequestMapping(value="listSchedule.do")
	public ModelAndView listSchedule(String u_id)
	{
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", dao.select(u_id));
		mView.setViewName("listSchedule");
		return mView;
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	// 일정 검색
	@RequestMapping(value="searchSchedule.do", produces="application/text;charset=utf8")
	@ResponseBody
	public String searchSchedule(HttpServletRequest request, 
			HttpServletResponse response, 
			String u_id, 
			String searchWord, 
			String searchSDate, String searchSHour, 
			String searchEDate, String searchEHour, 
			String curPage)
	{
		HttpSession session = request.getSession();
		//session.setAttribute("id", "choa");
		u_id = (String)session.getAttribute("id");
		System.out.println("u_id:" +u_id);
		System.out.println("searchWord:" +searchWord);
		
		int listCnt = 5;    // 한 페이지에 보여지는 건수
		int cPage   = 1;    // 현재 페이지
		if (curPage != null) cPage = Integer.parseInt(curPage);
		int sRno = (cPage - 1) * listCnt;
		int eRno = cPage * listCnt;
		System.out.println("sRno:" +sRno);
		System.out.println("eRno:" +eRno);
		
		DecimalFormat df = new DecimalFormat("00");
		searchSDate    = searchSDate.replaceAll("-", "");
		searchEDate    = searchEDate.replaceAll("-", "");
		String startd  = searchSDate + df.format(Integer.parseInt(searchSHour)); 
		String endd    = searchEDate + df.format(Integer.parseInt(searchEHour)); 
		System.out.println("startd:" +startd);
		System.out.println("endd:" +endd);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id",       u_id);
		map.put("searchWord", searchWord);
		map.put("startd",     startd);
		map.put("endd",       endd);
		map.put("sRno",       String.valueOf(sRno));
		map.put("eRno",       String.valueOf(eRno));
		
		StringBuffer sb     = new StringBuffer();
		sb.append("[");
		sb.append("");
		
		List<ScheduleVo> list = dao.selectSearch(map);
		for (Iterator scheduleVo = list.iterator(); scheduleVo.hasNext();) {
			ScheduleVo vo = (ScheduleVo) scheduleVo.next();
			sb.append("{");
			sb.append("\"s_num\":"      +vo.getS_num()    +",");
			sb.append("\"u_id\":\""     +vo.getU_id()     +"\",");
			sb.append("\"g_id\":\""     +vo.getG_id()     +"\",");
			sb.append("\"startd\":\""   +vo.getStartD()   +"\",");
			sb.append("\"endd\":\""     +vo.getEndD()     +"\",");
			sb.append("\"category\":"   +vo.getCategory() +",");
			sb.append("\"attach\":\""   +vo.getAttach()   +"\",");
			sb.append("\"title\":\""    +vo.getTitle()    +"\",");
			sb.append("\"content\":\""  +vo.getContent()  +"\",");
			sb.append("\"place\":\""    +vo.getPlace()    +"\",");
			sb.append("\"alarm\":\""    +vo.getAlarm()    +"\",");
			sb.append("\"finishd\":\""  +vo.getFinishd()  +"\",");
			sb.append("\"canceld\":\""  +vo.getFinishd()  +"\",");
			sb.append("\"delayd\":\""   +vo.getDelayd()   +"\"");
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
	
	//일정검색 페이지 링크 생성
	@RequestMapping(value="searchSchedulePage.do", produces="application/text;charset=utf8")
	@ResponseBody
	public String searchSchedulePage(HttpServletRequest request,
			HttpServletResponse response,
			String u_id,
			String searchWord,
			String searchSDate, String searchSHour,
			String searchEDate, String searchEHour,
			String curPage)
	{
		System.out.println("-----------------------------------");
		HttpSession session = request.getSession();
		//session.setAttribute("id", "choa");
		u_id = (String)session.getAttribute("id");
		System.out.println("u_id:" +u_id);
		System.out.println("searchWord:" +searchWord);
		
		int totRec   = 0; //일정검색 총 건수
		int pageSize = 3; //화면에 노출되는 페이지 수 
		int listCnt  = 5; //한 화면에 보여지는 건수
		int totPage  = 0; //총 페이지수
		int cPage    = 1; //현제 페이지
		
		if (curPage != null){
			//System.out.println("curPage is not null:" + curPage);
			cPage = Integer.parseInt(curPage);
		}
		
		DecimalFormat df = new DecimalFormat("00");
		searchSDate    = searchSDate.replaceAll("-", "");
		searchEDate    = searchEDate.replaceAll("-", "");
		String startd  = searchSDate + df.format(Integer.parseInt(searchSHour)); 
		String endd    = searchEDate + df.format(Integer.parseInt(searchEHour)); 
		System.out.println("startd:" +startd);
		System.out.println("endd:" +endd);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id",       u_id);
		map.put("searchWord", searchWord);
		map.put("startd",     startd);
		map.put("endd",       endd);
		
		//일정 검색된 건수
		totRec = dao.selectScheduleTot(map);
		
		if (totRec > 0){
			totPage = (int)Math.ceil((double)totRec / listCnt);
		}
		System.out.println("cPage:" + cPage +" totRec:" + totRec + " listCnt:" + listCnt + " totPage:" + totPage + " totRec/listCnt=" + ((double)totRec / listCnt));
		
		StringBuffer pagingSb = new StringBuffer();
		for(int i=1;i<=totPage;i++){
			if (cPage==i)
				pagingSb.append("<b>"+ i +"</b> ");
			else{
				pagingSb.append("<a href='searchSchedule.do?u_id="+u_id+"&");
				pagingSb.append("searchSDate="+searchSDate+"&searchSHour="+searchSHour+"&");
				pagingSb.append("searchEDate="+searchEDate+"&searchEHour="+searchEHour+"&");
				pagingSb.append("curPage="+ i +"' searchWord='"+searchWord+"'>" + i + "</a> ");
			}
		}
		System.out.println(pagingSb);
		
		return pagingSb.toString();
	}
	
	////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/insertSchedule.do", method=RequestMethod.GET)
	public ModelAndView form()
	{
		ModelAndView view = new ModelAndView();
		view.addObject("max",dao.maxSchedule());
		view.setViewName("calendar");
		System.out.println(dao.maxSchedule());
		return view;		
	}
	@RequestMapping(value="/insertSchedule.do", method=RequestMethod.POST, produces="application/text;charset=utf8")
	@ResponseBody
	public String submit(HttpServletRequest request, ScheduleVo sv)
	{
		//System.out.println(sv.getTitle());
		//System.out.println(sv.getsDate());
		//System.out.println(sv.geteDate());
		DecimalFormat df = new DecimalFormat("00");
		
		System.out.println(sv.getsDate());
		System.out.println(sv.getsHour());
		
		
		String sDate = sv.getsDate().replaceAll("-", "") + df.format(sv.getsHour());
		String eDate = sv.geteDate().replaceAll("-", "") + df.format(sv.geteHour());
		sv.setStartD(sDate);
		sv.setEndD(eDate);
		
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("id");
		
		sv.setU_id(u_id);
		
		
//		ModelAndView view = new ModelAndView();
		
		MultipartFile mp = sv.getUploadFile();
//		System.out.println("mp : "+sv.getUploadFile());
		sv.setAttach("");		
		
		if(mp!=null){
		
		String fname = mp.getOriginalFilename();
			String path = request.getRealPath("resources/upload");
			System.out.println("path:"+path);
			try{
				int i=0;
				File file = new File(path+"/"+fname);
				String name= fname.substring(0,fname.lastIndexOf("."));
				while(file.exists())
				{
					String ext = fname.substring(fname.lastIndexOf("."));
					fname = name + i + ext;
					file = new File(path+"/"+fname);
					i++;
				}				
				FileOutputStream out=new FileOutputStream(path+"/"+fname);
				byte[] fdata=mp.getBytes();
				out.write(fdata);
				out.close();
				sv.setAttach(fname);
				
			}catch(Exception ex)			
			{
				System.out.println(ex);
			}
		}
		
		int re = dao.insertSchedule(sv);
		String returnData="";
		if(re==1){
			returnData="{\"isInserted\": \"true\"}";
		}
		System.out.println("returnData : "+returnData);
//		view.setViewName("redirect:/mStartPage.show");
//		return view;
		return returnData;
		
	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	//일정검색(개인)
	@RequestMapping(value="selectSchedulePsn.do", produces="application/text;charset=utf8")
	@ResponseBody
	public String searchSchedulePsn(HttpServletRequest request,
			String startDate, 
			String startHour)
	{
		HttpSession session = request.getSession();
		//session.setAttribute("id", "choa");
		String u_id = (String)session.getAttribute("id");
		System.out.println("u_id:" + u_id);
		System.out.println("startDate:" + startDate);
		System.out.println("startHour:" + startHour);
		
		DecimalFormat df = new DecimalFormat("00");
		startDate      = startDate.replaceAll("-", "");
		String sStartd = startDate + df.format(Integer.parseInt(startHour)); 
		System.out.println("sStartd:" +sStartd);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id",       u_id);
		map.put("sStartd",    sStartd);
		
		StringBuffer sb     = new StringBuffer();
		sb.append("[");
		sb.append("");
		
		List<ScheduleVo> list = dao.selectSchedulePsn(map);
		for (Iterator scheduleVo = list.iterator(); scheduleVo.hasNext();) {
			ScheduleVo vo = (ScheduleVo) scheduleVo.next();
			sb.append("{");
			sb.append("\"s_num\":"      +vo.getS_num()    +",");
			sb.append("\"u_id\":\""     +vo.getU_id()     +"\",");
			sb.append("\"g_id\":\""     +vo.getG_id()     +"\",");
			sb.append("\"startd\":\""   +vo.getStartD()   +"\",");
			sb.append("\"endd\":\""     +vo.getEndD()     +"\",");
			sb.append("\"category\":"   +vo.getCategory() +",");
			sb.append("\"attach\":\""   +vo.getAttach()   +"\",");
			sb.append("\"title\":\""    +vo.getTitle()    +"\",");
			sb.append("\"content\":\""  +vo.getContent()  +"\",");
			sb.append("\"place\":\""    +vo.getPlace()    +"\",");
			sb.append("\"alarm\":\""    +vo.getAlarm()    +"\",");
			sb.append("\"finishd\":\""  +vo.getFinishd()  +"\",");
			sb.append("\"canceld\":\""  +vo.getFinishd()  +"\",");
			sb.append("\"delayd\":\""   +vo.getDelayd()   +"\"");
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
	
	///////////////////////////////////////////////////////////////////////////////////////
	//일정검색(개인)
	@RequestMapping(value="selectScheduleGid.do", produces="application/text;charset=utf8")
	@ResponseBody
	public String searchScheduleGid(HttpServletRequest request,
			String startDate, 
			String startHour)
	{
		HttpSession session = request.getSession();
		//session.setAttribute("id", "choa");
		String u_id = (String)session.getAttribute("id");
		System.out.println("u_id:" + u_id);
		System.out.println("startDate:" + startDate);
		System.out.println("startHour:" + startHour);
		
		DecimalFormat df = new DecimalFormat("00");
		startDate      = startDate.replaceAll("-", "");
		String sStartd = startDate + df.format(Integer.parseInt(startHour)); 
		System.out.println("sStartd:" + sStartd);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id",       u_id);
		map.put("sStartd",    sStartd);
		
		StringBuffer sb     = new StringBuffer();
		sb.append("[");
		sb.append("");
		
		List<ScheduleVo> list = dao.selectScheduleGid(map);
		for (Iterator scheduleVo = list.iterator(); scheduleVo.hasNext();) {
			ScheduleVo vo = (ScheduleVo) scheduleVo.next();
			sb.append("{");
			sb.append("\"s_num\":"          +vo.getS_num()    +",");
			sb.append("\"u_id\":\""         +vo.getU_id()     +"\",");
			sb.append("\"g_id\":\""         +vo.getG_id()     +"\",");
			sb.append("\"startd\":\""       +vo.getStartD()   +"\",");
			sb.append("\"endd\":\""         +vo.getEndD()     +"\",");
			sb.append("\"category\":"       +vo.getCategory() +",");
			sb.append("\"attach\":\""       +vo.getAttach()   +"\",");
			sb.append("\"title\":\""        +vo.getTitle()    +"\",");
			sb.append("\"content\":\""      +vo.getContent()  +"\",");
			sb.append("\"place\":\""        +vo.getPlace()    +"\",");
			sb.append("\"alarm\":\""        +vo.getAlarm()    +"\",");
			sb.append("\"finishd\":\""      +vo.getFinishd()  +"\",");
			sb.append("\"canceld\":\""      +vo.getFinishd()  +"\",");
			sb.append("\"delayd\":\""       +vo.getDelayd()   +"\",");
			sb.append("\"cheif_u_id\":\""   +vo.getDelayd()   +"\",");
			sb.append("\"cheif_u_name\":\"" +vo.getDelayd()   +"\"");
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
	
	/*
	@RequestMapping(value="detailBoard.do")
	public ModelAndView detailBoard(int b_no)
	{
		ModelAndView mView = new ModelAndView();
		System.out.println("b_no : " + b_no);
		mView.addObject("b_hit", BoardManager.updateB_hit(b_no));
		mView.addObject("b", BoardManager.selectOne(b_no));
		mView.setViewName("detailBoard");
		return mView;
	}
	
	@RequestMapping(value="insertBoard.do")
	public ModelAndView insertBoard()
	{
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("insertBoard");
		return mView;
	}
	
	@RequestMapping(value="insertBoardOk.do")
	public ModelAndView insertBoardOk(HttpServletRequest req, BoardVo vo)
	{
		String path = req.getRealPath("\\resources\\upload");
		System.out.println("path:" + path);
		
		MultipartFile uploadFile = vo.getUploadFile();
		if (uploadFile!=null)
		{
			String fileName = uploadFile.getOriginalFilename();
			int   fileSize  = (int)uploadFile.getSize();
			vo.setB_fname(fileName);
			try {
				byte fileData[] = uploadFile.getBytes();
				FileOutputStream output = new FileOutputStream(path +"\\" + fileName);
				output.write(fileData);
				output.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		}
		
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("re", BoardManager.insert(vo));
		mView.setViewName("detailBoard");
		return mView;
	}
	
	@RequestMapping(value="updateBoard.do")
	public ModelAndView updateBoard(int b_no)
	{
		ModelAndView mView = new ModelAndView();
		mView.addObject("b",  BoardManager.selectOne(b_no));
		mView.setViewName("updateBoard");
		return mView;
	}
	
	@RequestMapping(value="updateBoardOk.do")
	public ModelAndView updateBoard(BoardVo vo)
	{
		ModelAndView mView = new ModelAndView();
		mView.addObject("re", BoardManager.update(vo));
		mView.addObject("b",  BoardManager.selectOne(vo.getB_no()));
		mView.setViewName("detailBoard");
		return mView;
	}
	
	@RequestMapping(value="deleteBoardOk.do")
	public ModelAndView deleteBoard(int b_no)
	{
		ModelAndView mView = new ModelAndView();
		mView.addObject("re", BoardManager.delete(b_no));
		mView.addObject("list", BoardManager.select());
		mView.setViewName("listBoard");
		return mView;
	}
	*/
}
