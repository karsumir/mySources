package com.hanb.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public class F_TestDao {

	public String getFavorites(String u_id)
	{
		//���ã�� �׷����� �Էµ� �迭 ������ String
		System.out.println("daoid"+u_id);
		String str="[";
		F_TestVo fv=F_TestManager.getFavorites(u_id);
		str+="[\'UI\',"+"\'count\'],";
		str+="[\'����\',"+fv.getU_schdlr()+"],";
		str+="[\'�޸�\',"+fv.getU_memo()+"],";
		str+="[\'����\',"+fv.getU_wthr()+"]";
		str+="]";
		return str;
	}
}
