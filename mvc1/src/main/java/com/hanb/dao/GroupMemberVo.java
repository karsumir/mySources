package com.hanb.dao;

public class GroupMemberVo {
	
	private int g_id;
	private String g_name;
	private String u_id; 
	private String u_joinD;//그룹 가입일 
	private int chairman;//그룹장 여부 
	private int regY;//현재 등록 여부 
	private String chief_u_id;
	
	public String getChief_u_id() {
		return chief_u_id;
	}
	public void setChief_u_id(String chief_u_id) {
		this.chief_u_id = chief_u_id;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_joinD() {
		return u_joinD;
	}
	public void setU_joinD(String u_joinD) {
		this.u_joinD = u_joinD;
	}
	public int getChairman() {
		return chairman;
	}
	public void setChairman(int chairman) {
		this.chairman = chairman;
	}
	public int getRegY() {
		return regY;
	}
	public void setRegY(int regY) {
		this.regY = regY;
	}
	
	
	
	
}
