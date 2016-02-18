package com.hanb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hanb.dao.MemberVo;
import com.hanb.dao.MemoDao;
import com.hanb.dao.MemoManager;
import com.hanb.dao.MemoVo;

@Controller
public class MemoController {
	
	@Autowired
	MemoDao dao;
	
	@RequestMapping(value="/insertMemo.do",method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();

		mav.setViewName("memo/insertMemo");
	
		return mav;
	}
	
	@RequestMapping(value="/insertMemo.do",method=RequestMethod.POST)	
	public ModelAndView submit(MemoVo m, HttpServletRequest req,HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		String u_id = session.getAttribute("id").toString();
		m.setU_id(u_id);
		
		m.setM_num(MemoManager.MaxMemo());
		String path = req.getRealPath("/resources/upload");
		System.out.println("title : "+m.getM_title());
		System.out.println("path : "+path);
		MultipartFile uploadFile = m.getUploadFile();
		String fname = "";
		m.setM_fname("");
		
		if(uploadFile != null && !fname.equals("")){
			fname = uploadFile.getOriginalFilename();
			System.out.println("fname : "+fname);
			System.out.println("파일 업로드중");
			try{
				int i = 0;
				File file = new File(path+"/"+fname);
				String name = fname.substring(0,fname.lastIndexOf("."));
				while(file.exists()){
					System.out.println("파일 존재여부 : "+file.exists());
					String ext = fname.substring(fname.lastIndexOf("."));
					fname = name + i + ext;
					file = new File(path + "/" + fname);
					i++;
				}
				
				FileOutputStream out = new FileOutputStream(path+"/"+fname);
				byte[] fdata = uploadFile.getBytes();
				out.write(fdata);
				out.close();
				m.setM_fname(fname);
				
			}catch(Exception e){
				System.out.println();
			}
		}		
		
		int re = dao.insert(m);
		mav.setViewName("redirect:/listMemo.do");
			
		return mav;
	}
		
	@RequestMapping(value="/updateMemo.do",method=RequestMethod.POST)
	public ModelAndView update(MemoVo m, HttpServletRequest req,HttpSession session){
		ModelAndView mav = new ModelAndView();
		String u_id = session.getAttribute("id").toString();
		m.setU_id(u_id);		
		
		String path = req.getRealPath("/resources/upload");
		System.out.println("path : "+path);
		System.out.println("title1 : "+m.getM_title());
		MultipartFile upload = m.getUploadFile();
		String fname = upload.getOriginalFilename();
		System.out.println(fname);
		String oldFname = dao.detail(m.getM_num()).getM_fname();
		if(oldFname == null)
			m.setM_fname("");
		else
			m.setM_fname(oldFname);
		
		if(!fname.equals("")){
			System.out.println("기존 파일명 : "+oldFname);
			
			try{
				if(oldFname != null && !oldFname.equals("")){
					File file = new File(path+"/"+oldFname);
					file.delete();
					System.out.println("기존 파일삭제 : "+oldFname);
				}				
				
				int i = 0;
				File file = new File(path+"/"+fname);
				String name = fname.substring(0,fname.lastIndexOf("."));
				while(file.exists()){
					System.out.println("파일 존재여부 : "+file.exists());
					String ext = fname.substring(fname.lastIndexOf("."));
					fname = name + i + ext;
					System.out.println("파일명 : "+fname);
					file = new File(path + "/" + fname);
					i++;
				}
				
				FileOutputStream out = new FileOutputStream(path+"/"+fname);
				byte[] data = upload.getBytes();
				out.write(data);
				out.close();
				m.setM_fname(fname);
				
			}catch(Exception e){
				System.out.println(e);
			}
		}
		
		mav.setViewName("redirect:/listMemo.do");

		return mav;
	}
	
	@RequestMapping(value="/detailMemo.do")
	public ModelAndView detail(int m_num, HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		mav.addObject("m", dao.detail(m_num));
		mav.setViewName("memo/detailMemo");
		return mav;
	}	
	
	@RequestMapping(value="/listMemo.do")
	public ModelAndView list(HttpSession session, HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		
		String u_id = session.getAttribute("id").toString();
		System.out.println("id : "+u_id);

		mav.addObject("list", dao.list(u_id));

		Device device = DeviceUtils.getCurrentDevice(req);
		if(device.isNormal()){
			System.out.println("memo Desktop");
			mav.setViewName("memo/listMemo");
		}
		else if(device.isMobile()){
			System.out.println("memo Mobile");
			mav.setViewName("memo/mlistMemo");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/deleteMemo.do")
	public ModelAndView delete(int m_num, HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		
		try{
			String fname = dao.detail(m_num).getM_fname();
			if(fname != null && !fname.equals("")){
				String path = req.getRealPath("/resources/upload");
				File file = new File(path+"/"+fname);
				file.delete();				
			}			
		}catch(Exception e){
			System.out.println(e);
		}
		
		int re = dao.delete(m_num);
		mav.setViewName("redirect:/listMemo.do");

		return mav;
	}	
		
	@RequestMapping(value="memoList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String mList(HttpSession session){
		String str="";	
		String u_id = session.getAttribute("id").toString();
		List<MemoVo> list= dao.list(u_id);
		
			StringBuffer sb=new StringBuffer();
			sb.append("[");
			for(MemoVo m:list){
				sb.append("{");
				sb.append("\"m_num\":\""+m.getM_num()+"\",");
				sb.append("\"u_id\":\""+m.getU_id()+"\",");
				sb.append("\"m_title\":\""+m.getM_title()+"\",");
				sb.append("\"m_content\":\""+m.getM_content()+"\",");
				sb.append("\"m_fname\":\""+m.getM_fname()+"\"");
				sb.append("}");
				sb.append(",");	
			}
			str=sb.toString();
			str=str.substring(0,str.lastIndexOf(","));
			str+="]";
			System.out.println(str);

		return str;
	}

}
