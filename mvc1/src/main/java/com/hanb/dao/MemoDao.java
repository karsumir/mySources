package com.hanb.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanb.dao.MemoManager;
import com.hanb.dao.MemoVo;

@Repository
public class MemoDao {
	
	public int insert(MemoVo m){
		return MemoManager.insert(m);
	}
	
	public int update(MemoVo m){
		return MemoManager.update(m);
	}
	
	public int delete(int m_num){
		return MemoManager.delete(m_num);
	}
	
	public List<MemoVo> list(String u_id){
		return MemoManager.list(u_id);
	}
	
	public MemoVo detail(int m_num){
		return MemoManager.detail(m_num);
	}
}
