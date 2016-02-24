package com.bbs.dao;

import org.springframework.stereotype.Repository;

import com.bbs.db.bbsManager;
import com.bbs.vo.BbsVo;

@Repository
public class BbsDao {

	public int insert(BbsVo v){
		return bbsManager.insert(v);
	}
}
