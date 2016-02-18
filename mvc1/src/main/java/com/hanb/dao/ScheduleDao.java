package com.hanb.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanb.dao.ScheduleManager;
import com.hanb.dao.ScheduleVo;

@Repository
public class ScheduleDao {

	 
	public String forCalendar(HashMap<String, String> map)
	{
		String str="[";
		List<ScheduleVo> list = ScheduleManager.forCalendar(map);
		for(ScheduleVo v : list){
			str += "{";
			str += "\"s_num\":"+v.getS_num()+",\"u_id\":\""+v.getU_id()+"\",\"startD\":\""+v.getStartD()+"\","
					+"\"endD\":\""+v.getEndD()+"\",\"attach\":\""+v.getAttach()+"\",\"title\":\""+v.getTitle()+"\","
					+"\"content\":\""+v.getContent()+"\",\"place\":\""+v.getPlace()+"\"";
			str += "},";
		}
		if(str.lastIndexOf(",") > str.lastIndexOf("}")){
			str = str.substring(0, str.lastIndexOf(","));
		}
		str +="]";
		return str;
	}

	public List<ScheduleVo> select(String u_id)
	{
		List<ScheduleVo> list = ScheduleManager.select(u_id);
		return list;
	}
	
	public List<ScheduleVo> selectSearch(HashMap<String, String> map)
	{
		List<ScheduleVo> list = ScheduleManager.selectSearch(map);
		return list;
	}
	public int insertSchedule(ScheduleVo sv)
	{
		return ScheduleManager.insert(sv);		
	}
	public int maxSchedule()
	{
		return ScheduleManager.max();
	}
	
	public int selectScheduleTot(HashMap<String, String> map)
	{
		return ScheduleManager.selectSearchTot(map);
	}
	
	//개인 일정 조회
	public List<ScheduleVo> selectSchedulePsn(HashMap<String, String> map)
	{
		List<ScheduleVo> list = ScheduleManager.selectSchedulePsn(map);
		return list;
	}
	//그룹 일정 조회
	public List<ScheduleVo> selectScheduleGid(HashMap<String, String> map)
	{
		List<ScheduleVo> list = ScheduleManager.selectScheduleGid(map);
		return list;
	}
}
