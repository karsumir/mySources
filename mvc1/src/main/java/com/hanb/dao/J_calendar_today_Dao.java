package com.hanb.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Repository
public class J_calendar_today_Dao {

	public String getCalendar_Today(String u_id){
		//메인에 뿌려줄 오늘로 끝나는 일정 목록
		String str="[";
		List<ScheduleVo> list=ScheduleManager.getCalendar_Today(u_id);
		if(list.size()==0)
		{
			str+="{\"result\":\"no\"}";
		}
		else{
			System.out.println(list.size());
			for(int i=0;i<list.size();i++)
			{
				str+="{\"startD\":\""+list.get(i).getStartD()+"\",";
				str+="\"endD\":\""+list.get(i).getEndD()+"\",";
				str+="\"title\":\""+list.get(i).getTitle()+"\"},";
			}
			System.out.println(str);
			str=str.substring(0,str.lastIndexOf(","));
		};
		str+="]";
		System.out.println(str);
		return str;
	}
	
	public String getCalendar_Today_area(String u_id){
		//메인에 뿌려줄 오늘이 포함된 일정 목록
		String str="[";
		List<ScheduleVo> list=ScheduleManager.getCalendar_Today_area(u_id);
		if(list.size()==0)
		{
			str+="{\"result\":\"no\"}";
		}
		else{
			for(int i=0;i<list.size();i++)
			{
				str+="{\"startD\":\""+list.get(i).getStartD()+"\",";
				str+="\"endD\":\""+list.get(i).getEndD()+"\",";
				str+="\"title\":\""+list.get(i).getTitle()+"\"},";
			}
			System.out.println(str);
			str=str.substring(0,str.lastIndexOf(","));
		};
		str+="]";
		System.out.println(str);
		return str;
	}
	
}
