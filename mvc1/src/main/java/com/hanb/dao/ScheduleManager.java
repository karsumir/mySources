package com.hanb.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanb.dao.ScheduleVo;

public class ScheduleManager {
	
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/hanb/db/sqlMapper.xml");
			sqlMapper     = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
	
	//J_calendar_today_dao에서 연결되는 메소드 - 오늘로 종료되는 일정들
	public static List<ScheduleVo> getCalendar_Today(String u_id){
		SqlSession session = sqlMapper.openSession();
		//System.out.println(u_id);
		List<ScheduleVo> list = session.selectList("schedule.today_list", u_id);
		//System.out.println(list.toString());
		session.close();
		return list;
	}
	//J_calendar_today_dao에서 연결되는 메소드 - 오늘이 포함된 모든 일정
	public static List<ScheduleVo> getCalendar_Today_area(String u_id){
		SqlSession session = sqlMapper.openSession();
		//System.out.println(u_id);
		List<ScheduleVo> list = session.selectList("schedule.today_listAll", u_id);
		//System.out.println(list.toString());
		session.close();
		return list;
	}
	public static List<ScheduleVo> forCalendar(HashMap<String, String> map){
		SqlSession session = sqlMapper.openSession();
		List<ScheduleVo> list = session.selectList("schedule.selectCalendar",map);
		session.close();
		return list;
	}
	
	public static List<ScheduleVo> select(String u_id)
	{
		SqlSession session = sqlMapper.openSession();
		List<ScheduleVo> list = session.selectList("schedule.select");
		session.close();
		return list;
	}
	
	public static List<ScheduleVo> selectSearch(HashMap<String, String> map)
	{
		SqlSession session = sqlMapper.openSession();
		List<ScheduleVo> list = session.selectList("schedule.selectSearch", map);
		session.close();
		return list;
	}
	public static int insert(ScheduleVo sv)
	{
		SqlSession session = sqlMapper.openSession(true);
		int re = session.insert("schedule.insert",sv);
		session.commit();
		session.close();
		return re;		
	}	
	public static int max()
	{
		SqlSession session=sqlMapper.openSession();
		int max=session.selectOne("schedule.max");
		session.close();
		return max;
	}	
	public static int selectSearchTot(HashMap<String, String> map)
	{
		SqlSession session=sqlMapper.openSession();
		int tot=session.selectOne("schedule.selectSearchTot", map);
		session.close();
		return tot;
	}
	
	// 개인일정 조회 20160125
	public static List<ScheduleVo> selectSchedulePsn(HashMap<String, String> map)
	{
		SqlSession session = sqlMapper.openSession();
		List<ScheduleVo>  list = session.selectList("schedule.selectSchedulePsn", map);
		session.close();
		return list;
	}
	
	// 그룹일정 조회 20160125
	public static List<ScheduleVo> selectScheduleGid(HashMap<String, String> map)
	{
		SqlSession session = sqlMapper.openSession();
		List<ScheduleVo>  list = session.selectList("schedule.selectScheduleGid", map);
		session.close();
		return list;
	}
	
	
	
	/*
	public static BoardVo selectOne(int b_no)
	{
		SqlSession session = sqlMapper.openSession();
		BoardVo vo = session.selectOne("schedule.selectOne", b_no);
		session.close();
		return vo;
	}

	public static int delete(int b_no)
	{
		SqlSession session = sqlMapper.openSession();
		int re = session.delete("schedule.delete", b_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static int update(BoardVo vo)
	{	
		SqlSession session = sqlMapper.openSession();
		int re = session.update("schedule.update", vo);
		session.commit();
		session.close();
		return re;
	}
	
	public static int updateB_hit(int b_no)
	{	
		SqlSession session = sqlMapper.openSession();
		int re = session.update("schedule.updateB_hit", b_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static int insert(BoardVo vo)
	{
		SqlSession session = sqlMapper.openSession();
		int re = session.insert("schedule.insert", vo);
		session.commit();
		session.close();
		return re;
	}
	*/
	
	
}
