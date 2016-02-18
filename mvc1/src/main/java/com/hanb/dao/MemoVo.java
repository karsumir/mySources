package com.hanb.dao;

import org.springframework.web.multipart.MultipartFile;

public class MemoVo {
	int m_num;
	String u_id;
	String m_title;
	String m_content;
	String m_temp;
	String m_fname;
	MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getM_fname() {
		return m_fname;
	}
	public void setM_fname(String m_fname) {
		this.m_fname = m_fname;
	}
	public String getM_temp() {
		return m_temp;
	}
	public void setM_temp(String m_temp) {
		this.m_temp = m_temp;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	
}
