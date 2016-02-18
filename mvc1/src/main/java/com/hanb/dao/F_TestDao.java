package com.hanb.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public class F_TestDao {

	public String getFavorites(String u_id)
	{
		//즐겨찾기 그래프에 입력될 배열 형태의 String
		System.out.println("daoid"+u_id);
		String str="[";
		F_TestVo fv=F_TestManager.getFavorites(u_id);
		str+="[\'UI\',"+"\'count\'],";
		str+="[\'일정\',"+fv.getU_schdlr()+"],";
		str+="[\'메모\',"+fv.getU_memo()+"],";
		str+="[\'날씨\',"+fv.getU_wthr()+"]";
		str+="]";
		return str;
	}
}
